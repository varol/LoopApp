//
//  HomePresenter.swift
//  LOOP
//
//  Created by Varol Aksoy
//

import Foundation

protocol HomePresenterInterface: AnyObject {
    func viewDidLoad()
}

final class HomePresenter: HomePresenterInterface {

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
        interactor.fetchProducts()
    }
}

extension HomePresenter: HomeInteractorOutputInterface {
    func handleProductResult(_ result: ProductResult) {
        switch result {
        case .success(let response):
            debugPrint(response.products)
        case .failure(let error):
            debugPrint(error.message)
        }
    }
}
