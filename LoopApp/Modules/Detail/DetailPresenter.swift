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
    func loadData()
    func addBasketButtonTapped()

    var product: Product { get set }
}

extension DetailPresenter {
    fileprivate enum Constants {
        static let maxRatingValue: String = "5"
    }
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
        loadData()
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

    func loadData() {
        if let productName = product.title {
            view.setProductName(productName)
        }

        if let productDescription = product.productDescription {
            view.setProductDescription(productDescription)
        }

        if let price = product.price {
            view.setProductPrice("$\(price)")
        }

        if let rating = product.rating {
            view.setProductRating("\(rating) \\ \(Constants.maxRatingValue)")
        }

        if let stock = product.stock {
            view.setProductStock("\(stock)")
        }

        if let brand = product.brand {
            view.setProductBrand(brand)
        }

        if let category = product.category {
            view.setProductCategory(category)
        }
    }

    func addBasketButtonTapped() {
        if let productId = product.id {
            debugPrint("add basket with product id: \(productId)")
        }
    }
}

extension DetailPresenter: DetailInteractorOutputInterface {

}
