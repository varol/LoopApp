//
//  ProductCollectionViewCell.swift
//  LoopApp
//
//  Created by Varol Aksoy on 22.04.2022.
//

import Hero
import UIKit

protocol ProductCollectionViewCellInterface: AnyObject {
    func setProductImageView(_ imageUrl: String, placeholderImage: String)
    func setProductName(_ text: String)
    func setRating(_ text: String)
    func setPrice(_ text: String)
    func setProductImageViewHeroID(_ text: String)
}

final class ProductCollectionViewCell: BaseCollectionViewCell {

    @IBOutlet private weak var productImage: BaseImageView!
    @IBOutlet private weak var productNameLabel: BaseLabel!
    @IBOutlet private weak var ratingLabel: BaseLabel!
    @IBOutlet private weak var priceLabel: BaseLabel!
    @IBOutlet private weak var containerView: BaseView!

    var presenter: ProductCollectionViewCellPresenterInterface! {
        didSet {
            presenter.load()
        }
    }

    @IBAction private func addBasketButtonTapped() {
        presenter.addBasketButtonTapped()
    }
}

extension ProductCollectionViewCell: ProductCollectionViewCellInterface {
    func setProductImageView(_ imageUrl: String, placeholderImage: String) {
        let url = URL(string: imageUrl)
        let placeholder = UIImage(named: placeholderImage)
        productImage.kf.indicatorType = .activity

        productImage.kf.setImage(with: url) { result in
           switch result {
           case .failure(_):
                self.productImage.image = placeholder
           case .success(_):break
           }
         }
    }

    func setProductName(_ text: String) {
        productNameLabel.text = text
    }

    func setRating(_ text: String) {
        ratingLabel.text = text
    }

    func setPrice(_ text: String) {
        priceLabel.text = text
    }

    func setProductImageViewHeroID(_ text: String) {
        productImage.heroID = text
    }
}
