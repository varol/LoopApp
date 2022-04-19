//
//  HomeViewController.swift
//  LOOP
//
//  Created by Varol Aksoy
//

import UIKit

protocol HomeViewControllerInterface: AnyObject {

}

final class HomeViewController: BaseViewController {
    @IBOutlet private weak var collectionView: UICollectionView!

    var presenter: HomePresenterInterface!

    override func viewDidLoad() {
        presenter.viewDidLoad()

    }
}

extension HomeViewController: HomeViewControllerInterface {

}
