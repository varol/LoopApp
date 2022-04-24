//
//  ProductCollectionViewCellPresenterTests.swift
//  LoopAppTests
//
//  Created by Varol Aksoy on 24.04.2022.
//

@testable import LoopApp
import XCTest

final class ProductCollectionViewCellPresenterTests: XCTestCase {
    var view: MockProductCollectionViewCell!
    var presenter: ProductCollectionViewCellPresenter!
    var delegate: MockProductCollectionViewCellDelegate!
    var product: Product!

    override func setUp() {
        super.setUp()
        view = .init()
        delegate = .init()
        product = ProductResponse.response.products?.first
        presenter = .init(view: view, product: product, delegate: delegate)
    }

    func test_viewDidLoad_Invokes() {
        XCTAssertFalse(view.invokedSetProductImageView)
        XCTAssertFalse(view.invokedSetProductName)
        XCTAssertFalse(view.invokedSetRating)
        XCTAssertFalse(view.invokedSetPrice)
        XCTAssertFalse(view.invokedSetProductImageViewHeroID)

        XCTAssertNil(view.invokedSetProductImageViewParameters?.imageUrl)
        XCTAssertNil(view.invokedSetProductNameParameters?.text)
        XCTAssertNil(view.invokedSetRatingParameters?.text)
        XCTAssertNil(view.invokedSetPriceParameters?.text)
        XCTAssertNil(view.invokedSetProductImageViewHeroIDParameters?.text)

        presenter.load()

        XCTAssertTrue(view.invokedSetProductImageView)
        XCTAssertTrue(view.invokedSetProductName)
        XCTAssertTrue(view.invokedSetRating)
        XCTAssertTrue(view.invokedSetPrice)
        XCTAssertTrue(view.invokedSetProductImageViewHeroID)

        XCTAssertEqual(view.invokedSetProductImageViewParameters?.imageUrl, "https://dummyjson.com/image/i/products/1/thumbnail.jpg")
        XCTAssertEqual(view.invokedSetProductNameParameters?.text, "iPhone 9")
        XCTAssertEqual(view.invokedSetRatingParameters?.text, "⭐️ 4.69")
        XCTAssertEqual(view.invokedSetPriceParameters?.text, "$549")
        XCTAssertEqual(view.invokedSetProductImageViewHeroIDParameters?.text, "iPhone 9")
    }

    func test_addBasketButtonTapped() {
        XCTAssertFalse(delegate.invokedAddBasketButtonTapped)
        XCTAssertNil(delegate.invokedAddBasketButtonTappedParameters?.productId)

        presenter.addBasketButtonTapped()

        XCTAssertTrue(delegate.invokedAddBasketButtonTapped)
        XCTAssertEqual(delegate.invokedAddBasketButtonTappedParameters?.productId, 1)

    }
}
