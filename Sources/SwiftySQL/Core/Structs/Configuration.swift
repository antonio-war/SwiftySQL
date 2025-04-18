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
    public let autocreate: Bool
    public let cache: Cache
}
