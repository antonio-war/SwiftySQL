//
//  Configuration.swift
//  SwiftySQL
//
//  Created by Antonio Guerra on 17/04/25.
//

import Foundation

public struct Configuration: Sendable {
    public let storage: Storage
    public let permission: Permission
    public let creation: Creation
    public let cache: Cache
    public let threading: Threading
    
    var flags: Int32 {
        storage.flag | permission.flag | creation.flag | cache.flag | threading.flag
    }
    
    var path: [CChar] {
        get throws {
            try storage.path
        }
    }
}
