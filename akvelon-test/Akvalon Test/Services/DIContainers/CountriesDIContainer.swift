//
//  CountriesDIContainer.swift
//  Akvalon Test
//
//  Created by Volodymyr on 17.04.2025.
//

import UIKit

struct CountriesDIContainer {
    func makeCountriesList() -> UIViewController {
        let countriesAPI = NetworkingCountriesAPI(networking: NetworkingSerivce.shared)
        let storage = StorageService()
        let dependencies = CountriesListDependency(networking: countriesAPI,
                                                   storage: storage)
        let vm = CountriesListVM(dependency: dependencies)
        let vc = CountriesListVC(viewModel: vm)
        vm.delegate = vc
        
        return vc
    }
}
