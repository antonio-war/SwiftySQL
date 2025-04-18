//
//  Mutex.swift
//  SwiftySQL
//
//  Created by Antonio Guerra on 18/04/25.
//

import SQLite3

public enum Threading: Flaggable {
    case concurrent
    case serialized
    
    var flag: Int32 {
        switch self {
        case .concurrent: SQLITE_OPEN_NOMUTEX
        case .serialized: SQLITE_OPEN_FULLMUTEX
        }
    }
}
