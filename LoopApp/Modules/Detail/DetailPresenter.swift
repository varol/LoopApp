//
//  DetailPresenter.swift
//  LoopApp
//
//  Created by Varol Aksoy on 22.04.2022.
//

import Foundation

protocol DetailPresenterInterface: class {

}

final class DetailPresenter: DetailPresenterInterface {

    unowned var view: DetailViewControllerInterface!
    let router: DetailRouterInterface!
    let interactor: DetailInteractorInterface!

    init(interactor: DetailInteractorInterface,  router: DetailRouterInterface, view:  DetailViewControllerInterface) {
        self.view = view
        self.interactor = interactor
        self.router = router
    }
}

extension DetailPresenter: DetailInteractorOutputInterface {

}
