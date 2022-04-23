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
}

extension HomeViewController {
    fileprivate enum Constants {
        static let logoImage: String = "logo"
        static let navigationTitleImageViewHeroID: String = "logoImage"
        static let navigationTitleImageViewWidthMultiplierValue: CGFloat = 0.2
        static let navigationTitleImageViewHeightMultiplierValue: CGFloat = 0.1
    }
}

final class HomeViewController: BaseViewController {
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var logoImageView: BaseImageView!
    lazy private var navigationTitleImageView = UIImageView()

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
        collectionView.hero.modifiers = [.cascade]
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(cellType: ProductCollectionViewCell.self)

        handleLayout()
    }

    func prepareNavigationBar() {
        navigationTitleImageView.image = UIImage(named: Constants.logoImage)
        navigationTitleImageView.contentMode = .scaleAspectFit
        navigationTitleImageView.heroID = Constants.navigationTitleImageViewHeroID
        navigationTitleImageView.translatesAutoresizingMaskIntoConstraints = false

        if let navigationController = navigationController {
            navigationController.backgroundColor(.white)
            navigationController.navigationBar.addSubview(navigationTitleImageView)

            NSLayoutConstraint.activate([
                navigationTitleImageView.centerXAnchor.constraint(equalTo: navigationController.navigationBar.centerXAnchor),
                navigationTitleImageView.centerYAnchor.constraint(equalTo: navigationController.navigationBar.centerYAnchor),
                navigationTitleImageView.widthAnchor.constraint(equalTo: navigationController.navigationBar.widthAnchor,
                                                                multiplier: Constants.navigationTitleImageViewWidthMultiplierValue),
                navigationTitleImageView.heightAnchor.constraint(equalTo: navigationController.navigationBar.widthAnchor,
                                                                 multiplier: Constants.navigationTitleImageViewHeightMultiplierValue)
            ])
        }
    }

    func reloadData() {
        self.collectionView.reloadData()
    }

    func handleLayout() {
        let size = NSCollectionLayoutSize(
            widthDimension: NSCollectionLayoutDimension.fractionalWidth(1),
            heightDimension: NSCollectionLayoutDimension.estimated(44)
        )

        let item = NSCollectionLayoutItem(layoutSize: size)
        let group = NSCollectionLayoutGroup.horizontal(layoutSize: size,
                                                       subitem: item,
                                                       count: 1)

        let section = NSCollectionLayoutSection(group: group)

        let layout = UICollectionViewCompositionalLayout(section: section)
        collectionView.collectionViewLayout = layout
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
            cell.hero.modifiers = [.fade, .scale(0.1)]
        }

        return cell
    }
}

extension HomeViewController: ProductCollectionViewCellDelegate {
    func addBasketButtonTapped(productId: Int) {
        debugPrint("add basket with product id: \(productId)")
    }
}
