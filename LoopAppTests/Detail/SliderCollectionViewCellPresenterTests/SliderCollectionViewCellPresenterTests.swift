//
//  SliderCollectionViewCellPresenterTests.swift
//  LoopAppTests
//
//  Created by Varol Aksoy on 24.04.2022.
//

@testable import LoopApp
import XCTest

class SliderCollectionViewCellPresenterTests: XCTestCase {
    var view: MockSliderCollectionViewCell!
    var presenter: SliderCollectionViewCellPresenter!
    var image: String!

    override func setUp() {
        super.setUp()
        view = .init()
        image = ProductResponse.response.products?.first?.images?.first
        presenter = .init(view: view, image: image)
    }

    func test_viewDidLoad_Invokes() {
        XCTAssertFalse(view.invokedSetProductImageView)
        XCTAssertNil(view.invokedSetProductImageViewParameters?.imageUrl)
        presenter.load()

        XCTAssertTrue(view.invokedSetProductImageView)
        XCTAssertEqual(view.invokedSetProductImageViewParameters?.imageUrl, "https://dummyjson.com/image/i/products/1/1.jpg")
    }

}
