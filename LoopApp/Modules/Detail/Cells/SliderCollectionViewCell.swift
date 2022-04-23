//
//  SliderCollectionViewCell.swift
//  LoopApp
//
//  Created by Varol Aksoy on 22.04.2022.
//

import Kingfisher
import UIKit

final class SliderCollectionViewCell: BaseCollectionViewCell {

    @IBOutlet weak var productImageView: BaseImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func configure(with imageURL: String) {
        let url = URL(string: imageURL)
        productImageView.kf.setImage(with: url)
    }
}
