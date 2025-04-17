//
//  NetworkingError.swift
//  Akvalon Test
//
//  Created by Volodymyr on 17.04.2025.
//

import Foundation

struct NetworkingError: Error {
    var path: String?
    var payload: String?
    var headers: String?
    var errorCode: Int?
    var dataUtf8: String?
    
    init(payload: String) {
        self.payload = payload
    }
    
    init(path: String?, payload: String?, headers: String, errorCode: Int?, dataUtf8: String?) {
        self.path = path
        self.payload = payload
        self.headers = headers
        self.errorCode = errorCode
        self.dataUtf8 = dataUtf8
    }
}
