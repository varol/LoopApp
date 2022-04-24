//
//  MockHomeRouter.swift
//  LoopAppTests
//
//  Created by Varol Aksoy on 24.04.2022.
//

import Foundation
@testable import LoopApp

final class MockHomeRouter: HomeRouterInterface {

    var invokedNavigate = false
    var invokedNavigateCount = 0
    var invokedNavigateParameters: (route: HomeRoutes, Void)?
    var invokedNavigateParametersList = [(route: HomeRoutes, Void)]()

    func navigate(_ route: HomeRoutes) {
        invokedNavigate = true
        invokedNavigateCount += 1
        invokedNavigateParameters = (route, ())
        invokedNavigateParametersList.append((route, ()))
    }
}
