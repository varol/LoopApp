//
//  BaseViewController.swift
//  LOOP
//
//  Created by Varol Aksoy
//

import UIKit

extension BaseViewController {
    fileprivate enum Constants {
        static let logoImage: String = "logo"
        static let basketImage: String = "basket"
        static let navigationTitleImageViewHeroID: String = "logoImage"

        enum UI {
            static let navigationTitleImageViewWidthMultiplierValue: CGFloat = 0.2
            static let navigationTitleImageViewHeightMultiplierValue: CGFloat = 0.1
            static let basketImageSize: CGSize = CGSize(width: 30, height: 30)
            static let basketImageSizeTrailingInset: CGFloat = -16
            static let basketViewInset: UIEdgeInsets = UIEdgeInsets(top: 44, left: 0, bottom: 0, right: 16)
            static let basketViewHeight: CGFloat = 150

        }
    }
}

class BaseViewController: UIViewController, LoadingShowable {
    lazy private var navigationTitleImageView = BaseImageView()
    lazy private var basketButton = UIButton()
    lazy private var basketView: TopBasketView = TopBasketView()

    override func viewDidLoad() {
        super.viewDidLoad()


    }

    func prepareNavigationBarItems() {
        navigationTitleImageView.image = UIImage(named: Constants.logoImage)
        navigationTitleImageView.contentMode = .scaleAspectFit
        navigationTitleImageView.heroID = Constants.navigationTitleImageViewHeroID
        navigationTitleImageView.hero.modifiers = [.cascade]
        navigationTitleImageView.translatesAutoresizingMaskIntoConstraints = false

        if let navigationController = navigationController {
            navigationController.backgroundColor(.white)
            navigationController.navigationBar.addSubview(navigationTitleImageView)
            navigationController.navigationBar.tintColor = .black
            NSLayoutConstraint.activate([
                navigationTitleImageView.centerXAnchor.constraint(equalTo: navigationController.navigationBar.centerXAnchor),
                navigationTitleImageView.centerYAnchor.constraint(equalTo: navigationController.navigationBar.centerYAnchor),
                navigationTitleImageView.widthAnchor.constraint(equalTo: navigationController.navigationBar.widthAnchor,
                                                                multiplier: Constants.UI.navigationTitleImageViewWidthMultiplierValue),
                navigationTitleImageView.heightAnchor.constraint(equalTo: navigationController.navigationBar.widthAnchor,
                                                                 multiplier: Constants.UI.navigationTitleImageViewHeightMultiplierValue)
            ])

            basketButton.setImage(UIImage(named: Constants.basketImage), for: .normal)
            basketButton.addTarget(self, action: #selector(onBasketButtonClicked), for: .touchUpInside)
            basketButton.translatesAutoresizingMaskIntoConstraints = false
            navigationController.navigationBar.addSubview(basketButton)
            NSLayoutConstraint.activate([
                basketButton.widthAnchor.constraint(equalToConstant: Constants.UI.basketImageSize.width),
                basketButton.heightAnchor.constraint(equalToConstant: Constants.UI.basketImageSize.height),
                basketButton.trailingAnchor.constraint(equalTo: navigationController.navigationBar.trailingAnchor,
                                                      constant: Constants.UI.basketImageSizeTrailingInset),
                basketButton.centerYAnchor.constraint(equalTo: navigationController.navigationBar.centerYAnchor)
            ])

            addBasketView()
        }
    }

    private func addBasketView() {
        basketView.view.translatesAutoresizingMaskIntoConstraints = false
        guard let window = UIWindow.keyWindow else { return }

        window.addSubview(basketView.view)

        NSLayoutConstraint.activate([
            basketView.view.heightAnchor.constraint(equalToConstant: Constants.UI.basketViewHeight),
            basketView.view.trailingAnchor.constraint(equalTo: window.safeAreaLayoutGuide.trailingAnchor,
                                                      constant: Constants.UI.basketViewInset.right),
            basketView.view.leadingAnchor.constraint(equalTo: window.safeAreaLayoutGuide.leadingAnchor,
                                                  constant: Constants.UI.basketViewInset.left),
            basketView.view.topAnchor.constraint(equalTo: window.safeAreaLayoutGuide.topAnchor,
                                            constant: Constants.UI.basketViewInset.top)
        ])
        window.bringSubviewToFront(basketView.view)
        basketView.view.isHidden = true
    }

    @objc func onBasketButtonClicked() {
        basketView.view.transform = basketView.view.transform.scaledBy(x: 0.001, y: 0.001)

        UIView.animate(withDuration: 0.5,
                       delay: .zero,
                       usingSpringWithDamping: 0.5,
                       initialSpringVelocity: 0.3,
                       options: .curveEaseInOut,
                       animations: {
            self.basketView.view.transform = CGAffineTransform.identity.scaledBy(x: 1.0, y: 1.0)
            self.basketView.view.isHidden.toggle()
        }, completion: nil)
    }
}
