//
//  HomePresenterTests.swift
//  LoopAppTests
//
//  Created by Varol Aksoy on 24.04.2022.
//

import XCTest
@testable import LoopApp

class HomePresenterTests: XCTestCase {
    var presenter: HomePresenter!
    var view: MockHomeViewController!
    var interactor: MockHomeInteractor!
    var router: MockHomeRouter!

    override func setUp() {
        super.setUp()
        view = .init()
        interactor = .init()
        router = .init()
        presenter = .init(interactor: interactor, router: router, view: view)
    }

    func test_viewDidLoad_InvokesRequiredViewMethods() {
        XCTAssertFalse(view.invokedPrepareCollectionView)
        XCTAssertEqual(view.invokedPrepareCollectionViewCount, 0)
        XCTAssertFalse(interactor.invokedFetchProducts)
        XCTAssertEqual(interactor.invokedFetchProductsCount, 0)

        presenter.viewDidLoad()

        XCTAssertTrue(view.invokedPrepareCollectionView)
        XCTAssertEqual(view.invokedPrepareCollectionViewCount, 1)
        XCTAssertTrue(interactor.invokedFetchProducts)
        XCTAssertEqual(interactor.invokedFetchProductsCount, 1)
    }

    func test_fetchProductsOutput() {
        XCTAssertFalse(view.invokedHideLoadingView)
        XCTAssertEqual(presenter.getProductsCount(), 0)
        XCTAssertFalse(view.invokedReloadData)
        XCTAssertNil(presenter.getProducts(with:0))

        presenter.handleProductResult(.success(.response))

        XCTAssertTrue(view.invokedHideLoadingView)
        XCTAssertEqual(presenter.getProductsCount(), 30)
        XCTAssertTrue(view.invokedReloadData)
        XCTAssertNotNil(presenter.getProducts(with:0))
    }

    func test_numberOfItems_NilResponse_ReturnItemCount() {
        XCTAssertEqual(presenter.getProductsCount(), 0)
    }

    func test_navigateToDetailWithEmtpyData() {
        XCTAssertFalse(router.invokedNavigate)
        XCTAssertEqual(router.invokedNavigateCount, 0)

        presenter.handleProductResult(.failure(.networkError))
        presenter.navigateToDetail(0)

        XCTAssertFalse(router.invokedNavigate)
        XCTAssertEqual(router.invokedNavigateCount, 0)
    }

    func test_navigateToDetailWithData() {
        XCTAssertFalse(router.invokedNavigate)
        XCTAssertEqual(router.invokedNavigateCount, 0)

        presenter.handleProductResult(.success(.response))
        presenter.navigateToDetail(0)

        XCTAssertTrue(router.invokedNavigate)
        XCTAssertEqual(router.invokedNavigateCount, 1)
    }

}

extension ProductResponse {
    static var response: ProductResponse {
        let bundle = Bundle(for: HomePresenterTests.self)
        let path = bundle.path(forResource: "ProductResponse", ofType: "json")!
        let file = try! String(contentsOfFile: path)
        let data = file.data(using: .utf8)!
        let homeResponse = try! JSONDecoder().decode(ProductResponse.self, from: data)
        return homeResponse
    }

    static var emptyResponse: ProductResponse? {
        nil
    }
}
