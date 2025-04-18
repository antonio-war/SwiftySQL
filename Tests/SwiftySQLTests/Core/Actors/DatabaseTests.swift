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
    
    @Test func connectWhenStorageIsPersistentThenConnectedShouldBeTrue() async throws {
        let url = fileManager.temporaryDirectory.appending(path: "test.sqlite")
        let configuration = Configuration(storage: .persistent(url: url))
        let database = Database(configuration: configuration)
        try await database.connect()
        #expect(await database.connected)
    }
    
    @Test func connectWhenStorageIsVolatileThenConnectedShouldBeTrue() async throws {
        let configuration = Configuration(storage: .volatile)
        let database = Database(configuration: configuration)
        try await database.connect()
        #expect(await database.connected)
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
    
    @Test func connectWhenCreationIsAutomaticAndPermissionIsReadOnlyThenAnErrorShouldBeThrown() async throws {
        let configuration = Configuration(storage: .volatile, permission: .readOnly, creation: .automatic)
        let database = Database(configuration: configuration)
        await #expect(throws: DatabaseError.connectionFailed) {
            try await database.connect()
        }
    }
    
    @Test func disconnectWhenStorageIsPersistentThenConnectedShouldBeFalse() async throws {
        let url = fileManager.temporaryDirectory.appending(path: "test.sqlite")
        let configuration = Configuration(storage: .persistent(url: url))
        let database = Database(configuration: configuration)
        try await database.connect()
        try await database.disconnect()
        #expect(await !database.connected)
    }
    
    @Test func disconnectWhenStorageIsVolatileThenConnectedShouldBeFalse() async throws {
        let configuration = Configuration(storage: .volatile)
        let database = Database(configuration: configuration)
        try await database.connect()
        try await database.disconnect()
        #expect(await !database.connected)
    }
    
    @Test func disconnectWhenDatabaseIsNotConnectedWhenAnErrorShouldBeThrown() async throws {
        let configuration = Configuration(storage: .volatile)
        let database = Database(configuration: configuration)
        await #expect(throws: DatabaseError.missingConnection) {
            try await database.disconnect()
        }
    }
}
