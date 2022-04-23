//
//  BaseLabel.swift
//  LoopApp
//
//  Created by Varol Aksoy on 23.04.2022.
//

import UIKit

class BaseLabel: UILabel {
    required init?(coder: NSCoder) {
        super.init(coder: coder)

        configureLabel()
        configureFont()
    }

    func configureLabel() {
    }

    func configureFont() {
        self.textColor = .darkGray
    }
}
