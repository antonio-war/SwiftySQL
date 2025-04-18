//
//  Database.swift
//  SwiftySQL
//
//  Created by Antonio Guerra on 17/04/25.
//

import Foundation
import SQLite3

public actor Database: Sendable {
    nonisolated(unsafe) private var pointer: OpaquePointer? = nil
    public let configuration: Configuration
    
    public init(configuration: Configuration) {
        self.configuration = configuration
    }
    
    public var connected: Bool {
        pointer != nil
    }
    
    public func connect() throws {
        guard !connected else { throw DatabaseError.existingConnection }
        let result = try sqlite3_open_v2(configuration.path, &pointer, configuration.flag, nil)
        guard result == SQLITE_OK else { throw DatabaseError.connectionFailed }
        guard pointer != nil else { throw DatabaseError.connectionFailed }
    }
    
    public func disconnect() throws {
        guard connected else { throw DatabaseError.missingConnection }
        let result = sqlite3_close_v2(pointer)
        guard result == SQLITE_OK else { throw DatabaseError.disconnectionFailed }
        pointer = nil
    }
        
    deinit {
        sqlite3_close_v2(pointer)
    }
}
