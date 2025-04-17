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
        let result = try sqlite3_open(path, &pointer)
        print(result)
    }
    
    private var path: [CChar] {
        get throws {
            guard let path = configuration.url.path().cString(using: .utf8) else {
                throw URLError(.badURL)
            }
            return path
        }
    }
    
    deinit {
        sqlite3_close(pointer)
    }
}
