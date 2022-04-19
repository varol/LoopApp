//
//  HomeInteractor.swift
//  LOOP
//
//  Created by Varol Aksoy
//

import Foundation
import LOOPCoreAPI

protocol HomeInteractorInterface: AnyObject {
    func fetchProducts()
}

protocol HomeInteractorOutputInterface: AnyObject {
    func handleProductResult(_ result: ProductResult)
}

typealias ProductResult = Result<ProductResponse, APIClientError>

final class HomeInteractor {
    weak var output: HomeInteractorOutputInterface?
    private let networkManager: NetworkManager<HomeEndpointItem>

    init(networkManager: NetworkManager<HomeEndpointItem> = NetworkManager()) {
        self.networkManager = networkManager
    }

}

extension HomeInteractor: HomeInteractorInterface {
    func fetchProducts() {
        networkManager.request(endpoint: .products,
                               type: ProductResponse.self) {[weak self] result in
            guard let self = self else { return }
            self.output?.handleProductResult(result)
        }
    }
}
