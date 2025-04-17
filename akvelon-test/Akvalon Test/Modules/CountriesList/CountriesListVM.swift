//
//  CountriesListVM.swift
//  Akvalon Test
//
//  Created by Volodymyr on 17.04.2025.
//

import Foundation


protocol CountiresListVMProtocol {
    var dataSource: [CountriesListVM.ListItem] { get }
    func loadData()
}

protocol CountriesListVMDelegate: AnyObject {
    func dataLoaded()
    func dataLoadedError(title: String ,description: String, repeat: EmptyClosure?)
}

final class CountriesListVM: CountiresListVMProtocol {
    weak var delegate: CountriesListVMDelegate?
    
    private let dependency: CountriesListDependency
    private var countries: [Country] = []
    private(set) var dataSource: [CountriesListVM.ListItem] = []
    
    //MARK: - Lifecycle
    
    init(dependency: CountriesListDependency) {
        self.dependency = dependency
    }
    
    //MARK: - Public
    
    func loadData() {
        dependency.networking.loadAll { [weak self] result in
            guard let self = self else { return }
            self.handleLoadCountries(countries: result)
        } failure: { [weak self] error in
            guard let self = self else { return }
            self.handleError(error: error)
        }
    }
    
    //MARK: - Private
    
    private func handleError(error: NetworkingError) {
        let errorDescription = error.payload ?? "netowrk_error_generic_description".localized
        self.delegate?.dataLoadedError(title: "network_error_title".localized,
                                       description: errorDescription,
                                       repeat: { [weak self] in
            guard let self = self else { return }
            self.loadData()
        })
    }
    
    private func handleLoadCountries(countries: [Country]) {
        self.countries = countries
        self.dataSource = prepareDataSource(countries: countries)
        self.delegate?.dataLoaded()
    }
    
    private func prepareDataSource(countries: [Country]) -> [ListItem] {
        let result = countries.map {
            let vm = CountryListItemTableCellVM(country: $0)
            vm.onAction = { }
            return ListItem.country(vm)
        }
        
        return result
    }
}


extension CountriesListVM {
    enum ListItem {
        case country(CountryListItemTableCellVM)
    }
}
