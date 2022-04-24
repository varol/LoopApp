//
//  MockProductCollectionViewCell.swift
//  LoopAppTests
//
//  Created by Varol Aksoy on 24.04.2022.
//

@testable import LoopApp
import Foundation

final class MockProductCollectionViewCell: ProductCollectionViewCellInterface {

    var invokedSetProductImageView = false
    var invokedSetProductImageViewCount = 0
    var invokedSetProductImageViewParameters: (imageUrl: String, placeholderImage: String)?
    var invokedSetProductImageViewParametersList = [(imageUrl: String, placeholderImage: String)]()

    func setProductImageView(_ imageUrl: String, placeholderImage: String) {
        invokedSetProductImageView = true
        invokedSetProductImageViewCount += 1
        invokedSetProductImageViewParameters = (imageUrl, placeholderImage)
        invokedSetProductImageViewParametersList.append((imageUrl, placeholderImage))
    }

    var invokedSetProductName = false
    var invokedSetProductNameCount = 0
    var invokedSetProductNameParameters: (text: String, Void)?
    var invokedSetProductNameParametersList = [(text: String, Void)]()

    func setProductName(_ text: String) {
        invokedSetProductName = true
        invokedSetProductNameCount += 1
        invokedSetProductNameParameters = (text, ())
        invokedSetProductNameParametersList.append((text, ()))
    }

    var invokedSetRating = false
    var invokedSetRatingCount = 0
    var invokedSetRatingParameters: (text: String, Void)?
    var invokedSetRatingParametersList = [(text: String, Void)]()

    func setRating(_ text: String) {
        invokedSetRating = true
        invokedSetRatingCount += 1
        invokedSetRatingParameters = (text, ())
        invokedSetRatingParametersList.append((text, ()))
    }

    var invokedSetPrice = false
    var invokedSetPriceCount = 0
    var invokedSetPriceParameters: (text: String, Void)?
    var invokedSetPriceParametersList = [(text: String, Void)]()

    func setPrice(_ text: String) {
        invokedSetPrice = true
        invokedSetPriceCount += 1
        invokedSetPriceParameters = (text, ())
        invokedSetPriceParametersList.append((text, ()))
    }

    var invokedSetProductImageViewHeroID = false
    var invokedSetProductImageViewHeroIDCount = 0
    var invokedSetProductImageViewHeroIDParameters: (text: String, Void)?
    var invokedSetProductImageViewHeroIDParametersList = [(text: String, Void)]()

    func setProductImageViewHeroID(_ text: String) {
        invokedSetProductImageViewHeroID = true
        invokedSetProductImageViewHeroIDCount += 1
        invokedSetProductImageViewHeroIDParameters = (text, ())
        invokedSetProductImageViewHeroIDParametersList.append((text, ()))
    }
}

