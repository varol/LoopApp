//
//  SplashViewController.swift
//  LOOP
//
//  Created by Varol Aksoy
//

import UIKit

protocol SplashViewControllerInterface: AnyObject {
    func prepareLogoImageView()
    func prepareNavigationBar()
}

final class SplashViewController: BaseViewController {
    @IBOutlet private weak var logoImageView: BaseImageView!

    var presenter: SplashPresenterInterface!

    override func viewDidLoad() {
        presenter.viewDidLoad()
    }
}

extension SplashViewController: SplashViewControllerInterface {
    func prepareLogoImageView() {
        logoImageView.hero.isEnabled = true
        logoImageView.heroID = "logoImage"
        logoImageView.hero.modifiers = [.fade, .scale(0.5)]
    }

    func prepareNavigationBar() {
        navigationController?.backgroundColor(.white)
    }
}
