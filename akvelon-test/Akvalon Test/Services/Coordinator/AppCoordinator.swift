//
//  AppCoordinator.swift
//  Akvalon Test
//
//  Created by Volodymyr on 17.04.2025.
//

import UIKit

class AppCoordinator: NSObject {
    private let window: UIWindow
    
    private let di = AppCoordinatorDI()
    private var countriesCoordinator: CountriesCoordinator?
    
    //MARK: - Lifecycle
    
    init(window: UIWindow) {
        self.window = window
    }
    
    func start() {
    }
    
    //MARK: - Private
    
    private func startCountriesFlow() {
        let rootVC = di.countriesDIContainer.makeCountriesList()
        let nav = UINavigationController(rootViewController: rootVC)
        countriesCoordinator = CountriesCoordinator(router: Router(presenter: nav))
        countriesCoordinator?.start()
        window.rootViewController = nav
        window.makeKeyAndVisible()
        UIView.transition(with: window,
                             duration: 0.3,
                             options: .transitionCrossDissolve,
                             animations: nil,
                             completion: nil)
    }
}


final class AppCoordinatorDI {
    let countriesDIContainer: CountriesDIContainer
    
    init() {
        countriesDIContainer = CountriesDIContainer()
    }
}
