//
//  SplashRouter.swift
//  LOOP
//
//  Created by Varol Aksoy
//

import UIKit

protocol SplashRouterInterface: AnyObject {
    func navigate(_ route: SplashRoutes)
}

enum SplashRoutes {
    case home
}

class SplashRouter: NSObject {

    var navigationController: UINavigationController?

    init(navigationController: UINavigationController?) {
        self.navigationController = navigationController
    }

    static func setupModule(navigationController: UINavigationController) -> SplashViewController {
        let view = SplashViewController()
        let interactor = SplashInteractor()
        let router = SplashRouter(navigationController: navigationController)
        let presenter = SplashPresenter(interactor: interactor, router: router, view: view)
        view.presenter = presenter
        interactor.output = presenter
        view.title = "Splash"
        return view
    }
}

extension SplashRouter: SplashRouterInterface {
    func navigate(_ route: SplashRoutes) {
        switch route {
        case .home:
            guard let navigationController = navigationController else { return }
            let homeVC = HomeRouter.setupModule(navigationController: navigationController)
            navigationController.setRootViewController(homeVC, animated: false)
        }
    }
}

