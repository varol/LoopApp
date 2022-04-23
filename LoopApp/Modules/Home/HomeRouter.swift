//
//  HomeRouter.swift
//  LOOP
//
//  Created by Varol Aksoy
//

import UIKit

protocol HomeRouterInterface: AnyObject {
    func navigate(_ route: HomeRoutes)
}

enum HomeRoutes {
    case detail(product: Product)
}

class HomeRouter: NSObject {

    var navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    static func setupModule(navigationController: UINavigationController) -> HomeViewController {
        let view = HomeViewController()
        let interactor = HomeInteractor()
        let router = HomeRouter(navigationController: navigationController)
        let presenter = HomePresenter(interactor: interactor, router: router, view: view)
        view.presenter = presenter
        interactor.output = presenter
        return view
    }
}

extension HomeRouter: HomeRouterInterface {
    func navigate(_ route: HomeRoutes) {
        switch route {
        case .detail(let product):
            let detailVC = DetailRouter.setupModule(product: product)
            detailVC.hero.isEnabled = true
            navigationController?.pushViewController(detailVC, animated: true)
        }
    }
}

