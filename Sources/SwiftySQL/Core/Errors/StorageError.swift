//
//  StorageError.swift
//  SwiftySQL
//
//  Created by Antonio Guerra on 18/04/25.
//

import Foundation

public enum StorageError: Error, LocalizedError {
    case invalidURL
    
    public var errorDescription: String? {
        switch self {
        case .invalidURL: String(localized: "Invalid storage URL")
        }
    }
    
    public var failureReason: String? {
        switch self {
        case .invalidURL: String(localized: "The URL contains characters that cannot be represented in the required format.")
        }
    }
    
    public var recoverySuggestion: String? {
        switch self {
        case .invalidURL: String(localized: "Please provide a valid file path URL that uses only supported characters.")
        }
    }
}
