//
//  Configuration.swift
//  SwiftySQL
//
//  Created by Antonio Guerra on 17/04/25.
//

import Foundation

public struct Configuration: Flaggable {
    public let storage: Storage
    public let permission: Permission
    public let creation: Creation
    public let cache: Cache
    public let threading: Threading
    
    public init(
        storage: Storage,
        permission: Permission = .readAndWrite,
        creation: Creation = .automatic,
        cache: Cache = .private,
        threading: Threading = .concurrent
    ) {
        self.storage = storage
        self.permission = permission
        self.creation = creation
        self.cache = cache
        self.threading = threading
    }
    
    var flag: Int32 {
        storage.flag | permission.flag | creation.flag | cache.flag | threading.flag
    }
    
    var path: [CChar] {
        get throws {
            try storage.path
        }
    }
}
