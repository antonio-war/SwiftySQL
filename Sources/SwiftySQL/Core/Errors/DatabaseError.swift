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
        case .connectionFailed: String(localized: "Failed to create a database connection", bundle: .module)
        case .disconnectionFailed: String(localized: "Failed to destroy a database connection", bundle: .module)
        case .existingConnection: String(localized: "Database connection already established", bundle: .module)
        case .missingConnection: String(localized: "Database connection does not exists", bundle: .module)
        }
    }
    
    public var failureReason: String? {
        switch self {
        case .connectionFailed: String(localized: "The connection attempt was unsuccessful.", bundle: .module)
        case .disconnectionFailed: String(localized: "The disconnection attempt was unsuccessful.", bundle: .module)
        case .existingConnection: String(localized: "An active connection to this database already exists.", bundle: .module)
        case .missingConnection: String(localized: "The operation requires an active database connection.", bundle: .module)
        }
    }
    
    public var recoverySuggestion: String? {
        switch self {
        case .connectionFailed: String(localized: "Check database configuration and ensure the database server is running.", bundle: .module)
        case .disconnectionFailed: String(localized: "Check for ongoing transactions or queries that might be preventing disconnection.", bundle: .module)
        case .existingConnection: String(localized: "Close the existing connection before attempting to reconnect, or use the established connection.", bundle: .module)
        case .missingConnection: String(localized: "Establish a connection to the database server before performing this operation.", bundle: .module)
        }
    }
}
