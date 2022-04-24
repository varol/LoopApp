//
//  MockSliderCollectionViewCell.swift
//  LoopAppTests
//
//  Created by Varol Aksoy on 24.04.2022.
//

@testable import LoopApp
import Foundation

final class MockSliderCollectionViewCell: SliderCollectionViewCellInterface {

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
}
