//
//  ErrorModel.swift
//  Solar Warning
//
//  Created by rafaeldelegate on 11/16/19.
//  Copyright © 2019 rafaeldelegate. All rights reserved.
//

import Foundation

class ErrorModel: Codable {
    
    var error: [String]?
    
    private enum CodingKeys: String, CodingKey {
        case error = "error"
    }
}
