//
//  APIFactory.swift
//  APIFactory
//
//  Created by Fran on 15/9/21.
//

import Foundation

public final class APIFactory {
    public init() {}

    public lazy var jsonAPIService: APIService = SimpleJSONAPIService()
}
