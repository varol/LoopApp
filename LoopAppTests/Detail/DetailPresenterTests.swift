//
//  DetailPresenterTests.swift
//  LoopAppTests
//
//  Created by Varol Aksoy on 24.04.2022.
//

import XCTest
@testable import LoopApp

final class DetailPresenterTests: XCTestCase {
    var presenter: DetailPresenter!
    var view: MockDetailViewController!
    var interactor: MockDetailInteractor!
    var router: MockDetailRouter!
    var product: Product!

    override func setUp() {
        super.setUp()
        view = .init()
        interactor = .init()
        router = .init()
        product = ProductResponse.response.products?.first
        presenter = .init(interactor: interactor,
                          router: router,
                          view: view,
                          product: product)
    }

    func test_viewDidLoad_Invokes() {
        XCTAssertFalse(view.invokedPrepareCollectionView)
        XCTAssertFalse(view.invokedPreparePageControl)
        XCTAssertFalse(view.invokedSetProductName)
        XCTAssertFalse(view.invokedSetProductDescription)
        XCTAssertFalse(view.invokedSetProductPrice)
        XCTAssertFalse(view.invokedSetProductRating)
        XCTAssertFalse(view.invokedSetProductStock)
        XCTAssertFalse(view.invokedSetProductBrand)
        XCTAssertFalse(view.invokedSetProductCategory)

        presenter.viewDidLoad()

        XCTAssertTrue(view.invokedPrepareCollectionView)
        XCTAssertTrue(view.invokedPreparePageControl)
        XCTAssertTrue(view.invokedSetProductName)
        XCTAssertTrue(view.invokedSetProductDescription)
        XCTAssertTrue(view.invokedSetProductPrice)
        XCTAssertTrue(view.invokedSetProductRating)
        XCTAssertTrue(view.invokedSetProductStock)
        XCTAssertTrue(view.invokedSetProductBrand)
        XCTAssertTrue(view.invokedSetProductCategory)
    }

    func test_parametersWithData() {
        XCTAssertNil(view.invokedSetProductNameParameters?.text)
        XCTAssertNil(view.invokedSetProductDescriptionParameters?.text)
        XCTAssertNil(view.invokedSetProductPriceParameters?.text)
        XCTAssertNil(view.invokedSetProductRatingParameters?.text)
        XCTAssertNil(view.invokedSetProductStockParameters?.text)
        XCTAssertNil(view.invokedSetProductBrandParameters?.text)
        XCTAssertNil(view.invokedSetProductCategoryParameters?.text)

        presenter.viewDidLoad()

        XCTAssertEqual(view.invokedSetProductNameParameters?.text, "iPhone 9")
        XCTAssertEqual(view.invokedSetProductDescriptionParameters?.text, "An apple mobile which is nothing like apple")
        XCTAssertEqual(view.invokedSetProductPriceParameters?.text, "$549")
        XCTAssertEqual(view.invokedSetProductRatingParameters?.text, "4.69 \\ 5")
        XCTAssertEqual(view.invokedSetProductStockParameters?.text, "94")
        XCTAssertEqual(view.invokedSetProductBrandParameters?.text, "Apple")
        XCTAssertEqual(view.invokedSetProductCategoryParameters?.text, "smartphones")
    }

    func test_getImageCount() {
        XCTAssertEqual(presenter.getImageCount(), 5)
    }

    func test_getImageWithValidIndex() {
        XCTAssertEqual(presenter.getImage(with: .zero), "https://dummyjson.com/image/i/products/1/1.jpg")
    }

    func test_getImageWithUnvalidIndex() {
        XCTAssertNil(presenter.getImage(with: 99))
    }

    func test_getProductName() {
        XCTAssertEqual(presenter.getProductName(), "iPhone 9")
    }
}
