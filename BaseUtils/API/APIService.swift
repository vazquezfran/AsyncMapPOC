//
//  APIService.swift
//  APIService
//
//  Created by Fran on 14/9/21.
//

import Foundation

public enum Method: String {
    case GET
    case PUT
    case POST
    case DELETE
}

public enum APIError: Error, Equatable {
    case serverError
    case decodeError
    case invalidURLError
}

public struct Endpoint: Equatable {
    public let baseURL: String
    public let method: Method
    public let path: String

    public init(baseURL: String, method: Method, path: String) {
        self.baseURL = baseURL
        self.method = method
        self.path = path
    }

    func toRequest() -> URLRequest {
        let path = "\(baseURL)\(path)"

        guard let url = URL(string: path) else { fatalError("Invalid URL") }
        var request = URLRequest(url: url)
        request.httpMethod = "\(method)"

        return request
    }
}

public protocol APIService {
    func call<T:Codable>(with endpoint: Endpoint) async -> (Result<T, Error>)
}
