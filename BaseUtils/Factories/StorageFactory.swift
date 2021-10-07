//
//  StorageFactory.swift
//  StorageFactory
//
//  Created by Fran on 18/9/21.
//

import Foundation

fileprivate struct Constants {
    static let locationFileName = "locations.plist"
    static let venuesFileName = "venues.plist"
}

public final class StorageFactory {
    public init() {}

    public lazy var locationFileStorage: StorageService = SimpleFileStorageService(fileName: Constants.locationFileName)
    public lazy var fourSquareFileStorage: StorageService = SimpleFileStorageService(fileName: Constants.venuesFileName)
}
