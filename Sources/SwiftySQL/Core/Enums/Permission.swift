//
//  Permission.swift
//  SwiftySQL
//
//  Created by Antonio Guerra on 18/04/25.
//

import SQLite3

public enum Permission: Flaggable {
    case readOnly
    case readAndWrite
    
    var flag: Int32 {
        switch self {
        case .readOnly: SQLITE_OPEN_READONLY
        case .readAndWrite: SQLITE_OPEN_READWRITE
        }
    }
}
