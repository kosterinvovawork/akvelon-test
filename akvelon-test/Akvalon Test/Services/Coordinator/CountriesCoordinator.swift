//
//  CountriesCoordinator.swift
//  Akvalon Test
//
//  Created by Volodymyr on 17.04.2025.
//

import UIKit

class CountriesCoordinator: Coordinatable {
    var onFinishFlow: EmptyClosure?
    var onCancelFlow: EmptyClosure? {
        didSet {
            router.onClose = onCancelFlow
        }
    }
    
    var router: Routable!
    
    //MARK: - Lifecycle
    
    required init(router: Routable) {
        
    }

    //MARK: - Public
    
    func start() {
        
    }
}
