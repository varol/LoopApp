//
//  DetailInteractor.swift
//  LoopApp
//
//  Created by Varol Aksoy on 22.04.2022.
//

import Foundation

protocol DetailInteractorInterface: class {

}

protocol DetailInteractorOutputInterface: class {

}

final class DetailInteractor {
    var output: DetailInteractorOutputInterface?
}

extension DetailInteractor: DetailInteractorInterface {

}
