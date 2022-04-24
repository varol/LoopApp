//
//  MockProductCollectionViewCellDelegate.swift
//  LoopAppTests
//
//  Created by Varol Aksoy on 24.04.2022.
//

import Foundation
@testable import LoopApp

final class MockProductCollectionViewCellDelegate: ProductCollectionViewCellDelegate {
    var invokedAddBasketButtonTapped = false
    var invokedAddBasketButtonTappedCount = 0
    var invokedAddBasketButtonTappedParameters: (productId: Int, Void)?
    var invokedAddBasketButtonTappedParametersList = [(productId: Int, Void)]()

    func addBasketButtonTapped(productId: Int) {
        invokedAddBasketButtonTapped = true
        invokedAddBasketButtonTappedCount += 1
        invokedAddBasketButtonTappedParameters = (productId, ())
        invokedAddBasketButtonTappedParametersList.append((productId, ()))
    }
}
