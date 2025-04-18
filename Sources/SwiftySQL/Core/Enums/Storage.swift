//
//  Storage.swift
//  SwiftySQL
//
//  Created by Antonio Guerra on 17/04/25.
//

import Foundation
import SQLite3

public enum Storage: Sendable {
    case persistent(url: URL)
    case volatile
    
    var flag: Int32 {
        switch self {
        case .persistent: SQLITE_OPEN_NOFOLLOW
        case .volatile: SQLITE_OPEN_MEMORY
        }
    }
    
    var path: [CChar] {
        get throws {
            let path = switch self {
            case .persistent(let url): url.path()
            case .volatile: ":memory:"
            }
            guard let path = path.cString(using: .utf8) else {
                throw StorageError.invalidURL
            }
            return path
        }
    }
}
