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
    }
}

extension SplashViewController: SplashViewControllerInterface {

}
