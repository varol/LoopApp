//
//  DetailPresenter.swift
//  LoopApp
//
//  Created by Varol Aksoy on 22.04.2022.
//

import Foundation

protocol DetailPresenterInterface: AnyObject {
    func viewDidLoad()
    func getImageCount() -> Int
    func getImage(with index: Int) -> String?
    func getProductName() -> String

    var product: Product { get set }
}

final class DetailPresenter: DetailPresenterInterface {
    var product: Product

    unowned var view: DetailViewControllerInterface!
    let router: DetailRouterInterface!
    let interactor: DetailInteractorInterface!

    init(interactor: DetailInteractorInterface,
         router: DetailRouterInterface,
         view:  DetailViewControllerInterface,
         product: Product) {
        self.view = view
        self.interactor = interactor
        self.router = router
        self.product = product
    }

    func viewDidLoad() {
        view.prepareCollectionView()
        view.preparePageControl()
        view.reloadData()
    }

    func getImage(with index: Int) -> String? {
        product.images?[safe: index]
    }

    func getImageCount() -> Int {
        product.images?.count ?? .zero
    }

    func getProductName() -> String {
        product.title ?? ""
    }
}

extension DetailPresenter: DetailInteractorOutputInterface {

}
