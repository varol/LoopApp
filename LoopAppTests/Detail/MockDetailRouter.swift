//
//  MockDetailRouter.swift
//  LoopAppTests
//
//  Created by Varol Aksoy on 24.04.2022.
//

import Foundation
@testable import LoopApp

final class MockDetailRouter: DetailRouterInterface {
    var invokedNavigate = false
    var invokedNavigateCount = 0
    var invokedNavigateParameters: (route: DetailRoutes, Void)?
    var invokedNavigateParametersList = [(route: DetailRoutes, Void)]()

    func navigate(_ route: DetailRoutes) {
        invokedNavigate = true
        invokedNavigateCount += 1
        invokedNavigateParameters = (route, ())
        invokedNavigateParametersList.append((route, ()))
    }
}
