//
//  StorageService.swift
//  Akvalon Test
//
//  Created by Volodymyr on 17.04.2025.
//

import Foundation

protocol StorageServiceProtocol  {
    func store<T: Codable>(object: T)
    func fetch<T: Codable>() -> T?
}


final class StorageService: StorageServiceProtocol {

    
    //Future
    func store<T: Codable>(object: T) {
        
    }
    
    func fetch<T>() -> T? where T : Decodable, T : Encodable {
        return nil
    }
}
