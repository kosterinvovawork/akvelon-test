//
//  NetworkingResponseSuccess.swift
//  Akvalon Test
//
//  Created by Volodymyr on 17.04.2025.
//

import Foundation

typealias NetworkingServiceResult = (Result<NetworkingResponseSuccess, NetworkingError>) -> ()
typealias NetworkingServiceDecodableResult<T> = (Result<T, NetworkingError>) -> ()

struct NetworkingResponseSuccess {
    public var response: URLResponse
    public var data: Data
    
    var statusCode: Int {
        guard let resp = response as? HTTPURLResponse else { return 200 }
        return resp.statusCode
    }
}

