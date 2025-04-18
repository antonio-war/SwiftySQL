//
//  DatabaseTests.swift
//  SwiftySQL
//
//  Created by Antonio Guerra on 17/04/25.
//

import Foundation
@testable import SwiftySQL
import Testing

@Suite
struct DatabaseTests {
    private let fileManager: FileManager = .default
    
    @Test func connectWhenStorageIsPersistentThenStatusShouldBeConnected() async throws {
        let url = fileManager.temporaryDirectory.appending(path: "test.sqlite")
        let configuration = Configuration(storage: .persistent(url: url))
        let database = Database(configuration: configuration)
        try await database.connect()
        await #expect(database.status == .connected)
    }
    
    @Test func connectWhenStorageIsVolatileThenStatusShouldBeConnected() async throws {
        let configuration = Configuration(storage: .volatile)
        let database = Database(configuration: configuration)
        try await database.connect()
        await #expect(database.status == .connected)
    }
    
    @Test func connectWhenStorageIsPersistentAndUrlIsNotValidThenAnErrorSouldBeThrown() async throws {
        let url = try #require(URL(string: "file:///path/to/file"))
        let configuration = Configuration(storage: .persistent(url: url))
        let database = Database(configuration: configuration)
        await #expect(throws: DatabaseError.connectionFailed) {
            try await database.connect()
        }
    }
    
    @Test func connectWhenDatabaseIsAlreadyConnectedThenAnErrorSouldBeThrown() async throws {
        let configuration = Configuration(storage: .volatile)
        let database = Database(configuration: configuration)
        try await database.connect()
        await #expect(throws: DatabaseError.existingConnection) {
            try await database.connect()
        }
    }
    
    @Test func disconnectWhenStorageIsPersistentThenStatusShouldBeDisconnected() async throws {
        let url = fileManager.temporaryDirectory.appending(path: "test.sqlite")
        let configuration = Configuration(storage: .persistent(url: url))
        let database = Database(configuration: configuration)
        try await database.connect()
        try await database.disconnect()
        await #expect(database.status == .disconnected)
    }
    
    @Test func disconnectWhenStorageIsVolatileThenStatusShouldBeDisconnected() async throws {
        let configuration = Configuration(storage: .volatile)
        let database = Database(configuration: configuration)
        try await database.connect()
        try await database.disconnect()
        await #expect(database.status == .disconnected)
    }
}
