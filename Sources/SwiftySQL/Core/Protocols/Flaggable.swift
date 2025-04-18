//
//  Flaggable.swift
//  SwiftySQL
//
//  Created by Antonio Guerra on 18/04/25.
//

protocol Flaggable: Sendable {
    var flag: Int32 { get }
}
