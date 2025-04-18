//
//  Creation.swift
//  SwiftySQL
//
//  Created by Antonio Guerra on 18/04/25.
//

import SQLite3

public enum Creation: Flaggable {
    case automatic
    case manual
    
    var flag: Int32 {
        switch self {
        case .automatic: SQLITE_OPEN_CREATE
        case .manual: SQLITE_NULL
        }
    }
}
