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

        configureFont()
    }

    func configureFont() {
        self.textColor = .darkGray
    }
}
