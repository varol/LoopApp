//
//  MockHomeViewController.swift
//  LoopAppTests
//
//  Created by Varol Aksoy on 24.04.2022.
//


@testable import LoopApp
import UIKit

final class MockHomeViewController: HomeViewControllerInterface {

    var invokedPrepareCollectionView = false
    var invokedPrepareCollectionViewCount = 0

    func prepareCollectionView() {
        invokedPrepareCollectionView = true
        invokedPrepareCollectionViewCount += 1
    }

    var invokedPrepareNavigationBar = false
    var invokedPrepareNavigationBarCount = 0

    func prepareNavigationBar() {
        invokedPrepareNavigationBar = true
        invokedPrepareNavigationBarCount += 1
    }

    var invokedReloadData = false
    var invokedReloadDataCount = 0

    func reloadData() {
        invokedReloadData = true
        invokedReloadDataCount += 1
    }

    var invokedShowLoadingView = false
    var invokedShowLoadingViewCount = 0

    func showLoadingView() {
        invokedShowLoadingView = true
        invokedShowLoadingViewCount += 1
    }

    var invokedHideLoadingView = false
    var invokedHideLoadingViewCount = 0

    func hideLoadingView() {
        invokedHideLoadingView = true
        invokedHideLoadingViewCount += 1
    }
}
