//
//  SplashViewController.swift
//  LOOP
//
//  Created by Varol Aksoy
//

import UIKit

protocol SplashViewControllerInterface: AnyObject {

}

final class SplashViewController: BaseViewController {
    @IBOutlet private weak var logoImageView: BaseImageView!

    var presenter: SplashPresenterInterface!

    override func viewDidLoad() {
        presenter.viewDidLoad()
        logoImageView.hero.isEnabled = true
        logoImageView.heroID = "logoImage"
        logoImageView.hero.modifiers = [.fade, .scale(0.5)]
    }
}

extension SplashViewController: SplashViewControllerInterface {

}
