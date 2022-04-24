//
//  SliderCollectionViewCell.swift
//  LoopApp
//
//  Created by Varol Aksoy on 22.04.2022.
//

import Kingfisher
import UIKit

protocol SliderCollectionViewCellInterface: AnyObject {
    func setProductImageView(_ imageUrl: String, placeholderImage: String)
}

final class SliderCollectionViewCell: BaseCollectionViewCell {
    @IBOutlet weak var productImageView: BaseImageView!
    
    var presenter: SliderCollectionViewCellPresenterInterface! {
        didSet {
            presenter.load()
        }
    }
}

extension SliderCollectionViewCell: SliderCollectionViewCellInterface {
    func setProductImageView(_ imageUrl: String, placeholderImage: String) {
        let url = URL(string: imageUrl)
        let placeholder = UIImage(named: placeholderImage)
        productImageView.kf.indicatorType = .activity

        productImageView.kf.setImage(with: url) { result in
           switch result {
           case .failure(_):
                self.productImageView.image = placeholder
           case .success(_):break
           }
         }
    }
}
