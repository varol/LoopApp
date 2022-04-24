//
//  MockDetailViewController.swift
//  LoopAppTests
//
//  Created by Varol Aksoy on 24.04.2022.
//

@testable import LoopApp
import UIKit

final class MockDetailViewController: DetailViewControllerInterface {

    var invokedPrepareCollectionView = false
    var invokedPrepareCollectionViewCount = 0

    func prepareCollectionView() {
        invokedPrepareCollectionView = true
        invokedPrepareCollectionViewCount += 1
    }

    var invokedPreparePageControl = false
    var invokedPreparePageControlCount = 0

    func preparePageControl() {
        invokedPreparePageControl = true
        invokedPreparePageControlCount += 1
    }

    var invokedReloadData = false
    var invokedReloadDataCount = 0

    func reloadData() {
        invokedReloadData = true
        invokedReloadDataCount += 1
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

    var invokedSetProductDescription = false
    var invokedSetProductDescriptionCount = 0
    var invokedSetProductDescriptionParameters: (text: String, Void)?
    var invokedSetProductDescriptionParametersList = [(text: String, Void)]()

    func setProductDescription(_ text: String) {
        invokedSetProductDescription = true
        invokedSetProductDescriptionCount += 1
        invokedSetProductDescriptionParameters = (text, ())
        invokedSetProductDescriptionParametersList.append((text, ()))
    }

    var invokedSetProductPrice = false
    var invokedSetProductPriceCount = 0
    var invokedSetProductPriceParameters: (text: String, Void)?
    var invokedSetProductPriceParametersList = [(text: String, Void)]()

    func setProductPrice(_ text: String) {
        invokedSetProductPrice = true
        invokedSetProductPriceCount += 1
        invokedSetProductPriceParameters = (text, ())
        invokedSetProductPriceParametersList.append((text, ()))
    }

    var invokedSetProductRating = false
    var invokedSetProductRatingCount = 0
    var invokedSetProductRatingParameters: (text: String, Void)?
    var invokedSetProductRatingParametersList = [(text: String, Void)]()

    func setProductRating(_ text: String) {
        invokedSetProductRating = true
        invokedSetProductRatingCount += 1
        invokedSetProductRatingParameters = (text, ())
        invokedSetProductRatingParametersList.append((text, ()))
    }

    var invokedSetProductStock = false
    var invokedSetProductStockCount = 0
    var invokedSetProductStockParameters: (text: String, Void)?
    var invokedSetProductStockParametersList = [(text: String, Void)]()

    func setProductStock(_ text: String) {
        invokedSetProductStock = true
        invokedSetProductStockCount += 1
        invokedSetProductStockParameters = (text, ())
        invokedSetProductStockParametersList.append((text, ()))
    }

    var invokedSetProductBrand = false
    var invokedSetProductBrandCount = 0
    var invokedSetProductBrandParameters: (text: String, Void)?
    var invokedSetProductBrandParametersList = [(text: String, Void)]()

    func setProductBrand(_ text: String) {
        invokedSetProductBrand = true
        invokedSetProductBrandCount += 1
        invokedSetProductBrandParameters = (text, ())
        invokedSetProductBrandParametersList.append((text, ()))
    }

    var invokedSetProductCategory = false
    var invokedSetProductCategoryCount = 0
    var invokedSetProductCategoryParameters: (text: String, Void)?
    var invokedSetProductCategoryParametersList = [(text: String, Void)]()

    func setProductCategory(_ text: String) {
        invokedSetProductCategory = true
        invokedSetProductCategoryCount += 1
        invokedSetProductCategoryParameters = (text, ())
        invokedSetProductCategoryParametersList.append((text, ()))
    }
}

