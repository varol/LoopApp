//
//  TopBasketView.swift
//  LoopApp
//
//  Created by Varol Aksoy on 24.04.2022.
//

import UIKit

class TopBasketView: UIViewController {
    @IBOutlet weak var containerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()
        containerView.roundCorner(with: .bottom, radius: 32)
    }

}

