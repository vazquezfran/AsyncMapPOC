//
//  SimpleFileStorageService.swift
//  SimpleFileStorageService
//
//  Created by Fran on 18/9/21.
//

import Foundation

final class SimpleFileStorageService {
    private let manager = FileManager.default
    private let fileName: String

    init(fileName: String)  {
        self.fileName = fileName
    }
}

extension SimpleFileStorageService: StorageService {
    func store<T>(identifier: String, item: T) throws where T : Decodable, T : Encodable {
        guard let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first else { throw StorageError.folderError }

        let fileURL = url.appendingPathComponent(identifier + fileName)
        let encoder = PropertyListEncoder()
        encoder.outputFormat = .xml

        let data = try encoder.encode(item)
        try data.write(to: fileURL)
    }

    func readStoredItem<T>(identifier: String) throws -> T where T : Decodable, T : Encodable {
        guard let url = manager.urls(for: .documentDirectory, in: .userDomainMask).first else { throw StorageError.folderError }

        let fileURL = url.appendingPathComponent(identifier + fileName)
        let data = try Data(contentsOf: fileURL)
        let decoder = PropertyListDecoder()

        return try decoder.decode(T.self, from: data)
    }
}
