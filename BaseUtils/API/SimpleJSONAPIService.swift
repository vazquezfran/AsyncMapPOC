//
//  SimpleJSONAPIService.swift
//  SimpleJSONAPIService
//
//  Created by Fran on 15/9/21.
//

import Foundation

fileprivate struct Constants {
    static let contentTypeHeader = "Content-Type"
    static let contentTypeJSON = "application/json"
}

final class SimpleJSONAPIService: APIService {
    func call<T:Codable>(with endpoint: Endpoint) async -> (Result<T, Error>) {
        var request = endpoint.toRequest()
        request.allHTTPHeaderFields = [Constants.contentTypeHeader: Constants.contentTypeJSON]

        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let result = try JSONDecoder().decode(T.self, from: data)

            return .success(result)

        } catch {
            return(.failure(APIError.decodeError))
        }
    }
}
