//
//  Router.swift
//  Akvalon Test
//
//  Created by Volodymyr on 17.04.2025.
//

import UIKit

class Router: NSObject, Routable {
    var onClose: EmptyClosure?
    
    private(set) var presenter: UINavigationController!
    private var rootVC: UIViewController?
    
    //MARK: - Lifecycle
    init(presenter: UINavigationController) {
        super.init()
        
        self.presenter = presenter
        rootVC = presenter.viewControllers.last
    }
}
