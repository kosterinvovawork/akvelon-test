//
//  Routable.swift
//  Akvalon Test
//
//  Created by Volodymyr on 17.04.2025.
//

import UIKit

protocol Routable: UINavigationControllerDelegate {
    var onClose: EmptyClosure? { get set }
    
    var presenter: UINavigationController! { get }
    
    func push(_ viewController: UIViewController, animated: Bool)
    func pop(animated: Bool)
}

extension Routable {
    func push(_ viewController: UIViewController, animated: Bool) {
        presenter.pushViewController(viewController, animated: animated)
    }
    
    func pop(animated: Bool) {
        presenter.popViewController(animated: animated)
    }
}
