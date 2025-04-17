//
//  NetworkingCountries.swift
//  Akvalon Test
//
//  Created by Volodymyr on 17.04.2025.
//

import Foundation

protocol NetworkingCountriesAPIProtocol {
    func loadAll(completion: @escaping  Closure<[Country]>,
                 failure: @escaping  Closure<NetworkingError>)
    func load(requestModel: CountriesRequestModel,
              completion: @escaping  Closure<[Country]>,
              failure: @escaping  Closure<NetworkingError>)
}

final class NetworkingCountriesAPI: NetworkingCountriesAPIProtocol {
    private let baseURL: String = "https://restcountries.com/v3.1/"
    
    private let networking: NetworkingSerivce
    
    //MARK: - Lifecycle
    
    init(networking: NetworkingSerivce) {
        self.networking = networking
    }
    
    //MARK: - Public
    
    func loadAll(completion: @escaping Closure<[Country]>,
                 failure: @escaping Closure<NetworkingError>) {
        let request = makeRequest(type: .all)
        loadCountries(request: request, completion: completion, failure: failure)
    }
    
    func load(requestModel: CountriesRequestModel,
              completion: @escaping  Closure<[Country]>,
              failure: @escaping  Closure<NetworkingError>) {
        let request = makeRequest(type: .all)
        loadCountries(request: request, completion: completion, failure: failure)
    }
    
    //MARK: - Private
    
    private func loadCountries(request: URLRequest,
                               completion: @escaping  Closure<[Country]>,
                               failure: @escaping  Closure<NetworkingError>) {
        networking.makeRequest(request: request, type: [Country].self) { result in
            switch result {
            case .success(let countries):
                completion(countries.compactMap {$0})
            case .failure(let error):
                failure(error)
            }
        }
    }
    
    private func makeRequest(type: Request) -> URLRequest {
        let path = type.path
        let url = URL(string: baseURL + path)!
        let request = URLRequest(url: url)
        
        return request
    }
}

extension NetworkingCountriesAPI {
    enum Request {
        case all
        case custom(CountriesRequestModel)
        
        var path: String {
            switch self {
            case .all: return "/all"
            case .custom(let model):
                let filters = model.filter.map {$0.rawValue}.joined(separator: ",")
                return "/all?fields=\(filters)"
            }
        }
    }
}
