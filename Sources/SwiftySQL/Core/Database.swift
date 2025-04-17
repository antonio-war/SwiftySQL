//
//  Database.swift
//  SwiftySQL
//
//  Created by Antonio Guerra on 17/04/25.
//

import Foundation
import SQLite3

public actor Database: Sendable {
    nonisolated(unsafe) private(set) var pointer: OpaquePointer? = nil
    public let configuration: Configuration
    
    public init(configuration: Configuration) {
        self.configuration = configuration
    }
    
    public func connect() throws {
        let result = try sqlite3_open_v2(path, &pointer, flags, nil)
        guard result == SQLITE_OK else { throw URLError(.badURL) }
    }
    
    private var path: [CChar] {
        get throws {
            let path = switch configuration.storage {
            case .persistent(let url): url.path()
            case .volatile: ":memory:"
            }
            guard let path = path.cString(using: .utf8) else {
                throw URLError(.badURL)
            }
            return path
        }
    }
    
    private var flags: Int32 {
        let storageFlags = switch configuration.storage {
            case .persistent: SQLITE_OPEN_URI
            case .volatile: SQLITE_OPEN_MEMORY
        }
        return storageFlags | SQLITE_OPEN_CREATE | SQLITE_OPEN_READWRITE | SQLITE_OPEN_FULLMUTEX
    }
    
    deinit {
        sqlite3_close_v2(pointer)
    }
}
