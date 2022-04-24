//
//  HomePresenter.swift
//  LOOP
//
//  Created by Varol Aksoy
//

import Foundation

protocol HomePresenterInterface: AnyObject {
    func viewDidLoad()
    func viewWillAppear()
    func getProductsCount() -> Int
    func getProducts(with index: Int) -> Product?
    func navigateToDetail(_ productIndex: Int)

    var products: [Product]? { get set }
}

final class HomePresenter: HomePresenterInterface {

    var products: [Product]? {
        didSet {
            view.reloadData()
        }
    }

    unowned var view: HomeViewControllerInterface!
    let router: HomeRouterInterface!
    let interactor: HomeInteractorInterface!

    init(interactor: HomeInteractorInterface,
         router: HomeRouterInterface,
         view: HomeViewControllerInterface) {

        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad() {
        view.prepareNavigationBar()
        view.showLoadingView()
        view.prepareCollectionView()
        interactor.fetchProducts()
    }

    func viewWillAppear() {
    }

    func getProductsCount() -> Int {
        products?.count ?? .zero
    }

    func getProducts(with index: Int) -> Product? {
        products?[safe: index]
    }

    func navigateToDetail(_ productIndex: Int) {
        guard let product = getProducts(with: productIndex) else {
            return
        }

        router.navigate(.detail(product: product))
    }
}

extension HomePresenter: HomeInteractorOutputInterface {
    func handleProductResult(_ result: ProductResult) {
        switch result {
        case .success(let response):
            self.products = response.products
            view.hideLoadingView()
        case .failure(let error):
            debugPrint(error.message)
        }
    }
}
