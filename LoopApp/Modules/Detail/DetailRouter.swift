//
//  DetailRouter.swift
//  LoopApp
//
//  Created by Varol Aksoy on 22.04.2022.
//

import UIKit

protocol DetailRouterInterface: AnyObject {
    func navigate(_ route: DetailRoutes)
}

enum DetailRoutes {
    
}

class DetailRouter: NSObject {

    weak var presenter: DetailPresenterInterface?
    weak var viewController: DetailViewController?
    
    static func setupModule(product: Product) -> DetailViewController {
        let vc = DetailViewController()
        let interactor = DetailInteractor()
        let router = DetailRouter()
        let presenter = DetailPresenter(interactor: interactor,
                                        router: router,
                                        view: vc,
                                        product: product)

        vc.presenter = presenter
        router.presenter = presenter
        interactor.output = presenter
        router.viewController = vc
        return vc
    }
}

extension DetailRouter: DetailRouterInterface {
    func navigate(_ route: DetailRoutes) {
        
    }
}

