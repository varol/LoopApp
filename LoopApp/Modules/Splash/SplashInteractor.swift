//
//  SplashInteractor.swift
//  LOOP
//
//  Created by Varol Aksoy
//

import Foundation

protocol SplashInteractorInterface: AnyObject {

}

protocol SplashInteractorOutputInterface: AnyObject {

}

final class SplashInteractor {
    var output: SplashInteractorOutputInterface?
}

extension SplashInteractor: SplashInteractorInterface {

}
