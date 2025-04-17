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
}
