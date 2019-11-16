//
//  EncodableObject.swift
//  Solar Warning
//
//  Created by rafaeldelegate on 11/16/19.
//  Copyright © 2019 rafaeldelegate. All rights reserved.
//

import Foundation

public struct EncodableObject: Encodable {
    
    private let encode: (Encoder) throws -> Void
    
    public init<T: Encodable>(_ objectWrapped: T) {
        encode = objectWrapped.encode
    }
    public func encode(to encoder: Encoder) throws {
        try encode(to: encoder)
    }
    
}
