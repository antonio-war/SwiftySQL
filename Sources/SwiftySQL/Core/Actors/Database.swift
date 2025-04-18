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
    
    public var status: Status {
        pointer != nil ? .connected : .disconnected
    }
    
    public func connect() throws {
        guard status == .disconnected else { throw DatabaseError.existingConnection }
        let result = try sqlite3_open_v2(configuration.path, &pointer, configuration.flags, nil)
        guard result == SQLITE_OK else { throw DatabaseError.connectionFailed }
    }
    
    public func disconnect() throws {
        guard status == .connected else { throw DatabaseError.missingConnection }
        let result = sqlite3_close_v2(pointer)
        guard result == SQLITE_OK else { throw DatabaseError.disconnectionFailed }
        pointer = nil
    }
        
    deinit {
        sqlite3_close_v2(pointer)
    }
}
