//
//  StorageTests.swift
//  SwiftySQL
//
//  Created by Antonio Guerra on 18/04/25.
//

import Foundation
@testable import SwiftySQL
import Testing

@Suite
struct StorageTests {
    
    @Test func pathWhenStorageIsPersistentAndUrlIsValidThenAnArrayShouldBeReturned() async throws {
        let url = URL(fileURLWithPath: "/database.sqlite")
        let storage = Storage.persistent(url: url)
        _ = try storage.path
    }
    
    @Test func pathWhenStorageIsVolatileThenAnArrayShouldBeReturned() async throws {
        let storage = Storage.volatile
        _ = try storage.path
    }
}
