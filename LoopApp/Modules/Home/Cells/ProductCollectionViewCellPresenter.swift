//
//  ProductCollectionViewCellPresenter.swift
//  LoopApp
//
//  Created by Varol Aksoy on 23.04.2022.
//

import Foundation

protocol ProductCollectionViewCellPresenterInterface {
    func load()
    func addBasketButtonTapped()

    var product: Product? { get set }
}

protocol ProductCollectionViewCellDelegate: AnyObject {
    func addBasketButtonTapped(productId: Int)
}

extension ProductCollectionViewCellPresenter {
    fileprivate enum Constants {
        static let placeholderImage: String = "no-image-available"
    }
}

final class ProductCollectionViewCellPresenter {
    weak var view: ProductCollectionViewCellInterface?
    internal var product: Product?
    weak var delegate: ProductCollectionViewCellDelegate?

    init(view: ProductCollectionViewCellInterface?,
         product: Product?,
         delegate: ProductCollectionViewCellDelegate) {
        self.view = view
        self.product = product
        self.delegate = delegate
    }


}

extension ProductCollectionViewCellPresenter : ProductCollectionViewCellPresenterInterface {
    func load() {
        if let productImage = product?.thumbnail {
            view?.setProductImageView(productImage,
                                      placeholderImage: Constants.placeholderImage)
        }

        if let productName = product?.title {
            view?.setProductName(productName)
            view?.setProductImageViewHeroID(productName)
        }

        if let rating = product?.rating {
            view?.setRating("⭐️ \(rating)")
        }

        if let price = product?.price {
            view?.setPrice("$\(price)")
        }
    }

    func addBasketButtonTapped() {
        if let productId = product?.id {
            delegate?.addBasketButtonTapped(productId: productId)
        }
    }
}
