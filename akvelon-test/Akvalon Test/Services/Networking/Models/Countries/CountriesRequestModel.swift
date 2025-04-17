//
//  NetworkingCountriesRequestModel.swift
//  Akvalon Test
//
//  Created by Volodymyr on 17.04.2025.
//

import Foundation

@frozen public enum CountriesRequestFilter: String {
    case region
    case name
}

struct CountriesRequestModel {
    let filter: [CountriesRequestFilter]
}
