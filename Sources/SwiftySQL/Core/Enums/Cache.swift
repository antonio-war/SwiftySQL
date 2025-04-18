//
//  Cache.swift
//  SwiftySQL
//
//  Created by Antonio Guerra on 18/04/25.
//

import SQLite3

public enum Cache: Flaggable {
    case `private`
    case `shared`
    
    var flag: Int32 {
        switch self {
        case .private: SQLITE_OPEN_PRIVATECACHE
        case .shared: SQLITE_OPEN_SHAREDCACHE
        }
    }
}
