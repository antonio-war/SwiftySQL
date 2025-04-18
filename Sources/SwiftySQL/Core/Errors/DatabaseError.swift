//
//  DatabaseError.swift
//  SwiftySQL
//
//  Created by Antonio Guerra on 18/04/25.
//

import Foundation

public enum DatabaseError: Error, LocalizedError {
    case connectionFailed
    case disconnectionFailed
    case existingConnection
    case missingConnection
    
    public var errorDescription: String? {
        switch self {
        case .connectionFailed: String(localized: "Failed to create a database connection")
        case .disconnectionFailed: String(localized: "Failed to destroy a database connection")
        case .existingConnection: String(localized: "Database connection already established")
        case .missingConnection: String(localized: "Database connection does not exists")
        }
    }
    
    public var failureReason: String? {
        switch self {
        case .connectionFailed: String(localized: "The connection attempt was unsuccessful.")
        case .disconnectionFailed: String(localized: "The disconnection attempt was unsuccessful.")
        case .existingConnection: String(localized: "An active connection to this database already exists.")
        case .missingConnection: String(localized: "The operation requires an active database connection.")
        }
    }
    
    public var recoverySuggestion: String? {
        switch self {
        case .connectionFailed: String(localized: "Check database configuration and ensure the database server is running.")
        case .disconnectionFailed: String(localized: "Check for ongoing transactions or queries that might be preventing disconnection.")
        case .existingConnection: String(localized: "Close the existing connection before attempting to reconnect, or use the established connection.")
        case .missingConnection: String(localized: "Establish a connection to the database server before performing this operation.")
        }
    }
}
