//
//  MockHomeInteractor.swift
//  LoopAppTests
//
//  Created by Varol Aksoy on 24.04.2022.
//

import Foundation
@testable import LoopApp

final class MockHomeInteractor: HomeInteractorInterface {

    var invokedFetchProducts = false
    var invokedFetchProductsCount = 0

    func fetchProducts() {
        invokedFetchProducts = true
        invokedFetchProductsCount += 1
    }
}
