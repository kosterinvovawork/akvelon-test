//
//  Coordinatable.swift
//  Akvalon Test
//
//  Created by Volodymyr on 17.04.2025.
//

import Foundation

typealias Coordinatable = CoordinatorRoutable & CoordinatorFlowable

protocol CoordinatorFlowable {
    var onFinishFlow: EmptyClosure? { get set }
    var onCancelFlow: EmptyClosure? { get set }
    
    func start()
}

protocol CoordinatorRoutable: AnyObject  {
    var router: Routable! { get }
    
    init(router: Routable)
}
