//
//  SliderCollectionViewCellPresenter.swift
//  LoopApp
//
//  Created by Varol Aksoy on 24.04.2022.
//

import Foundation

protocol SliderCollectionViewCellPresenterInterface {
    func load()

    var image: String? { get set }
}

extension SliderCollectionViewCellPresenter {
    fileprivate enum Constants {
        static let placeholderImage: String = "no-image-available"
    }
}

final class SliderCollectionViewCellPresenter {
    weak var view: SliderCollectionViewCellInterface?
    var image: String?

    init(view: SliderCollectionViewCellInterface?,
         image: String?) {
        self.view = view
        self.image = image
    }
}

extension SliderCollectionViewCellPresenter : SliderCollectionViewCellPresenterInterface {

    func load() {
        if let image = image {
            view?.setProductImageView(image, placeholderImage: Constants.placeholderImage)
        }
    }
}
