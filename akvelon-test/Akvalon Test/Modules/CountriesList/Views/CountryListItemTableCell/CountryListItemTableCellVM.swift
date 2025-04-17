//
//  CountryListItemTableCellVM.swift
//  Akvalon Test
//
//  Created by Volodymyr on 17.04.2025.
//

import Foundation

final class CountryListItemTableCellVM {    
    var onAction: EmptyClosure?
    
    private let country: Country
    
    init(country: Country) {
        self.country = country
    }
    
    //MARK: - Public
    
    var name: String { return country.name?.common ?? "" }
    var flag: String { return country.flag ?? "" }
}
