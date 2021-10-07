//
//  StorageService.swift
//  StorageService
//
//  Created by Fran on 18/9/21.
//

import Foundation

public enum StorageError: Error {
    case decodeError
    case encodeError
    case fileError
    case folderError
}

public protocol StorageService {
    func readStoredItem<T:Codable>(identifier: String) throws -> T
    func store<T:Codable>(identifier: String, item: T) throws -> Void
}
