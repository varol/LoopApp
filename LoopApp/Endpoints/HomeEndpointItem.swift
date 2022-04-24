//
//  HomeEndpointItem.swift
//  LOOP
//
//  Created by Varol Aksoy
//

import LOOPCoreAPI
import Foundation

enum HomeEndpointItem: Endpoint {
    case products
    var baseUrl: String { "https://dummyjson.com/"}

    var path: String {
        switch self {
        case .products:
            return "products"
        }
    }

    var method: HTTPMethod {
        switch self {
        case .products:
            return .get
        }
    }
}
