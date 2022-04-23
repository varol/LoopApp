//
//  LoadingView.swift
//  LOOP
//
//  Created by Varol Aksoy
//

import UIKit

class LoadingView: BaseView {
    var activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()
    static let shared = LoadingView()
    var containerView: UIView = UIView()

    private init() {
        super.init(frame: .zero)
        configure()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func configure() {
        containerView.translatesAutoresizingMaskIntoConstraints = false
        containerView.frame = UIWindow(frame: UIScreen.main.bounds).frame
        activityIndicator.center = containerView.center
        activityIndicator.hidesWhenStopped = true
        activityIndicator.color = .black
        if #available(iOS 13.0, *) {
            activityIndicator.style = .large
        } else {
            activityIndicator.style = .gray
        }
        activityIndicator.hidesWhenStopped = true
        containerView.addSubview(activityIndicator)
    }

    func startLoading() {
        guard let window = UIWindow.keyWindow else { return }
        window.addSubview(containerView)
        containerView.translatesAutoresizingMaskIntoConstraints = false
        activityIndicator.startAnimating()
    }

    func hideLoading() {
        containerView.removeFromSuperview()
        activityIndicator.stopAnimating()
    }
}
