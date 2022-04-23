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
}

final class DetailViewController: BaseViewController {
    @IBOutlet private weak var collectionView: UICollectionView!
    @IBOutlet private weak var pageControl: UIPageControl!
    var presenter: DetailPresenterInterface!

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        self.hero.isEnabled = true
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

}

extension DetailViewController: UICollectionViewDelegate {
}

extension DetailViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: collectionView.frame.width, height: 200)
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

        cell.hero.isEnabled = true
        cell.productImageView.heroID = presenter.getProductName()
        cell.hero.modifiers = [.fade, .scale(0.1)]

        if let image = presenter.getImage(with: indexPath.row) {
            cell.configure(with: image)
        }

        return cell
    }

    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let pageWidth = self.collectionView.frame.size.width
        let currentPage = Int(self.collectionView.contentOffset.x / pageWidth)
        pageControl.currentPage = currentPage
    }
}
