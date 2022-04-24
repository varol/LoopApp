//
//  SplashPresenter.swift
//  LOOP
//
//  Created by Varol Aksoy
//

import Foundation

protocol SplashPresenterInterface: AnyObject {
    func viewDidLoad()
}

final class SplashPresenter: SplashPresenterInterface {

    unowned private var view: SplashViewControllerInterface!
    let router: SplashRouterInterface!
    let interactor: SplashInteractorInterface!

    init(interactor: SplashInteractorInterface,
         router: SplashRouterInterface,
         view: SplashViewControllerInterface) {
        
        self.view = view
        self.interactor = interactor
        self.router = router
    }

    func viewDidLoad() {
        view.prepareLogoImageView()
        view.prepareNavigationBar()
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.router.navigate(.home)
        }
    }
}

extension SplashPresenter: SplashInteractorOutputInterface {

}
