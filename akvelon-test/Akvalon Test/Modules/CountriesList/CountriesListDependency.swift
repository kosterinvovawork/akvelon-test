//
//  CountriesListDependency.swift
//  Akvalon Test
//
//  Created by Volodymyr on 17.04.2025.
//

import Foundation

struct CountriesListDependency {
    var onFinish: Closure<Any>?
    let networking: NetworkingCountriesAPIProtocol
    let storage: StorageServiceProtocol
}
