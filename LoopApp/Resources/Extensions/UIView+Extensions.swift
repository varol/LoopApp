//
//  UIView+Extensions.swift
//  LoopApp
//
//  Created by Varol Aksoy on 23.04.2022.
//

import Foundation
import UIKit

enum RoundType {
    case top
    case none
    case bottom
    case both
}

extension UIView {
    func startRotating(duration: Double = 0.7) {
        let kAnimationKey = "rotation"
        if self.layer.animation(forKey: kAnimationKey) == nil {
            let animate = CABasicAnimation(keyPath: "transform.rotation")
            animate.duration = duration
            animate.repeatCount = Float.infinity
            animate.fromValue = 0.0
            animate.toValue = Double.pi * 2
            self.layer.add(animate, forKey: kAnimationKey)
        }
    }

    func roundCorner(with type: RoundType, radius: CGFloat = 3.0) {
        var corners: UIRectCorner

        switch type {
        case .top:
            corners = [.topLeft, .topRight]
        case .none:
            corners = []
        case .bottom:
            corners = [.bottomLeft, .bottomRight]
        case .both:
            corners = [.allCorners]
        }

        DispatchQueue.main.async {
            let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners,
                                    cornerRadii: CGSize(width: radius, height: radius))
            let mask = CAShapeLayer()
            mask.path = path.cgPath
            self.layer.mask = mask
        }
    }

}

extension UIView {
    func setShadow() {
        layer.shadowColor = UIColor.black.withAlphaComponent(0.4).cgColor
        layer.shadowOffset = CGSize(width: 0, height: 2)
        layer.shadowOpacity = 1
        layer.shadowRadius = 0
        layer.masksToBounds = false
    }
}
