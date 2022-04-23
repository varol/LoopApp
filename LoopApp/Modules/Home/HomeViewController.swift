//
//  HomeViewController.swift
//  LOOP
//
//  Created by Varol Aksoy
//

import UIKit

protocol HomeViewControllerInterface: AnyObject {
    func prepareCollectionView()
    func prepareNavigationBar()
    func reloadData()
    func showLoadingView()
    func hideLoadingView()
}

extension HomeViewController {
    fileprivate enum Constants {
        enum UI {
            static let fractionalWidth: CGFloat = 1
            static let estimatedHeight: CGFloat = 44
            static let groupCount: Int = 2
            static let heroScaleValue: CGFloat = 0.1
        }
    }
}

final class HomeViewController: BaseViewController {
    @IBOutlet private weak var collectionView: UICollectionView!

    var presenter: HomePresenterInterface!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        presenter.viewWillAppear()
    }
}

extension HomeViewController: HomeViewControllerInterface {
    func prepareCollectionView() {
        collectionView.hero.modifiers = [.fade]
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(cellType: ProductCollectionViewCell.self)

        handleLayout()
    }

    func prepareNavigationBar() {
        prepareNavigationBarItems()
    }

    func reloadData() {
        self.collectionView.reloadData()
    }

    func handleLayout() {
        let size = NSCollectionLayoutSize(
            widthDimension: NSCollectionLayoutDimension.fractionalWidth(Constants.UI.fractionalWidth),
            heightDimension: NSCollectionLayoutDimension.estimated(Constants.UI.estimatedHeight)
        )

        let item = NSCollectionLayoutItem(layoutSize: size)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: size,
                                                       subitem: item,
                                                       count: Constants.UI.groupCount)

        let section = NSCollectionLayoutSection(group: group)

        let layout = UICollectionViewCompositionalLayout(section: section)
        collectionView.collectionViewLayout = layout
    }

    func showLoadingView() {
        showLoading()
    }

    func hideLoadingView() {
        hideLoading()
    }
}

extension HomeViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        didSelectItemAt indexPath: IndexPath) {
        presenter.navigateToDetail(indexPath.row)
    }
}

extension HomeViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        presenter.getProductsCount()
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeCell(cellType: ProductCollectionViewCell.self,
                                            indexPath: indexPath)
        cell.hero.isEnabled = true
        if let product = presenter.getProducts(with: indexPath.row) {
            cell.presenter = ProductCollectionViewCellPresenter(view: cell,
                                                                product: product,
                                                                delegate: self)
            cell.hero.modifiers = [.fade, .scale(Constants.UI.heroScaleValue)]
        }

        return cell
    }
}

extension HomeViewController: ProductCollectionViewCellDelegate {
    func addBasketButtonTapped(productId: Int) {
        debugPrint("add basket with product id: \(productId)")
    }
}
