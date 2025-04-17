//
//  DatabaseTests.swift
//  SwiftySQL
//
//  Created by Antonio Guerra on 17/04/25.
//

import Foundation
@testable import SwiftySQL
import Testing
import XCTest

@Suite
struct DatabaseTests {
    private let fileManager: FileManager = .default
    
    @Test func initFromConfigurationWhenStorageIsPersistentThenPointerShouldBeNotNil() async throws {
        let url = fileManager.temporaryDirectory.appending(path: "test.sqlite")
        let configuration = Configuration(storage: .persistent(url: url))
        let database = Database(configuration: configuration)
        #expect(database.pointer == nil)
        try await database.connect()
        #expect(database.pointer != nil)
    }
    
    @Test func initFromConfigurationWhenStorageIsVolatileThenPointerShouldBeNotNil() async throws {
        let configuration = Configuration(storage: .volatile)
        let database = Database(configuration: configuration)
        #expect(database.pointer == nil)
        try await database.connect()
        #expect(database.pointer != nil)
    }
}
