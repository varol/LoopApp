//
//  DetailViewController.swift
//  LoopApp
//
//  Created by Varol Aksoy on 22.04.2022.
//

import UIKit

protocol DetailViewControllerInterface: AnyObject {
    func prepareCollectionView()
    func preparePageControl()
    func reloadData()
    func setProductName(_ text: String)
    func setProductDescription(_ text: String)
    func setProductPrice(_ text: String)
    func setProductRating(_ text: String)
    func setProductStock(_ text: String)
    func setProductBrand(_ text: String)
    func setProductCategory(_ text: String)
}

extension DetailViewController {
    fileprivate enum Constants {
        enum Logic {
            static let minimumImageValue: Int = 2
        }

        enum UI {
            static let cellHeight: CGFloat = 200
            static let heroScaleValue: CGFloat = 0.1
        }
    }
}

final class DetailViewController: BaseViewController {
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var pageControl: UIPageControl!
    @IBOutlet private weak var productNameLabel: BaseLabel!
    @IBOutlet private weak var productDescriptionLabel: BaseLabel!
    @IBOutlet private weak var priceLabel: BaseLabel!
    @IBOutlet private weak var ratingLabel: BaseLabel!
    @IBOutlet private weak var stockLabel: BaseLabel!
    @IBOutlet private weak var brandLabel: BaseLabel!
    @IBOutlet private weak var categoryLabel: BaseLabel!

    var presenter: DetailPresenterInterface!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        self.hero.isEnabled = true
    }

    @IBAction private func addBasketButtonTapped() {
        presenter.addBasketButtonTapped()
    }
}

extension DetailViewController: DetailViewControllerInterface {

    func prepareCollectionView() {
        collectionView.hero.modifiers = [.cascade]
        collectionView.backgroundColor = .white
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.isPagingEnabled = true
        collectionView.register(cellType: SliderCollectionViewCell.self)
    }

    func preparePageControl() {
        pageControl.isHidden = presenter.getImageCount() < Constants.Logic.minimumImageValue
        pageControl.numberOfPages = presenter.getImageCount()
    }

    func handleLayout() {
        if let flowLayout = collectionView.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        }
    }

    func reloadData() {
        self.collectionView.reloadData()
    }

    func setProductName(_ text: String) {
        productNameLabel.text = text
    }

    func setProductDescription(_ text: String) {
        productDescriptionLabel.text = text
    }

    func setProductPrice(_ text: String) {
        priceLabel.text = text
    }

    func setProductRating(_ text: String) {
        ratingLabel.text = text
    }

    func setProductStock(_ text: String) {
        stockLabel.text = text
    }

    func setProductBrand(_ text: String) {
        brandLabel.text = text
    }

    func setProductCategory(_ text: String) {
        categoryLabel.text = text
    }
}

extension DetailViewController: UICollectionViewDelegate {
}

extension DetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: Constants.UI.cellHeight)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        insetForSectionAt section: Int) -> UIEdgeInsets {
        return UIEdgeInsets(top: .zero, left: .zero, bottom: .zero, right: .zero)
    }

    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return .zero
    }
}

extension DetailViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView,
                        numberOfItemsInSection section: Int) -> Int {
        presenter.getImageCount()
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeCell(cellType: SliderCollectionViewCell.self,
                                            indexPath: indexPath)


        if let image = presenter.getImage(with: indexPath.row) {
            cell.presenter = SliderCollectionViewCellPresenter(view: cell, image: image)
            cell.hero.isEnabled = true
            cell.productImageView.heroID = presenter.getProductName()
            cell.hero.modifiers = [.fade, .scale(Constants.UI.heroScaleValue)]
        }

        
        return cell
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = self.collectionView.frame.size.width
        let currentPage = Int(self.collectionView.contentOffset.x / pageWidth)
        pageControl.currentPage = currentPage
    }
}
