//
//  NetworkingService.swift
//  Akvalon Test
//
//  Created by Volodymyr on 17.04.2025.
//

import Foundation

final class NetworkingSerivce {
    static let shared = NetworkingSerivce()

    private lazy var baseDecoder: JSONDecoder = {
        let decoder = JSONDecoder()
        decoder.keyDecodingStrategy = .convertFromSnakeCase
        return decoder
    }()
    private lazy var session: URLSession = {
        let config = URLSessionConfiguration.default
        config.requestCachePolicy = .returnCacheDataElseLoad
        config.timeoutIntervalForRequest = TimeInterval(10)
        let session = URLSession(configuration: config)
        
        return session
    }()
    
    public func makeRequest(request: URLRequest, result: @escaping NetworkingServiceResult) {
        let task = self.session.dataTask(with: request, completionHandler: { [request] (data, response, error) in
            guard let httpResp = response as? HTTPURLResponse else {
                result(.failure(NetworkingError(payload: "bad_data_response_title".localized)))
                return
            }
            
            guard let response = response, let data = data else {
                result(.failure(NetworkingError(payload: "bad_data_response_title".localized)))
                return
            }
            
            let statusCode = httpResp.statusCode
            guard statusCode == 200 || statusCode == 201 else {
                let error = NetworkingError(path: request.url?.absoluteString,
                                            payload: "unsuccess_response_title".localized,
                                            headers: "",
                                            errorCode: statusCode,
                                            dataUtf8: String(data: data, encoding: .utf8))
                result(.failure(error))
                return
            }
            
            let success = NetworkingResponseSuccess(response: response, data: data)
            result(.success(success))
        })
        
        task.resume()
    }
    
    public func makeRequest<T: Decodable>(request: URLRequest, type: T.Type, result: @escaping NetworkingServiceDecodableResult<T>) {
        makeRequest(request: request) { [weak self] res in
            guard let self = self else { return }
            switch res {
            case .success(let success):
                do {
                    let model = try self.baseDecoder.decode(T.self, from: success.data)
                    result(.success(model))
                } catch  {
                    let err = NetworkingError(payload: error.localizedDescription)
                    result(.failure(err))
                }
            case .failure(let error):
                result(.failure(error))
            }
        }
    }
}
