//
//  HTTPStatus.swift
//  Solar Warning
//
//  Created by rafaeldelegate on 11/16/19.
//  Copyright © 2019 rafaeldelegate. All rights reserved.
//

import Foundation
public enum HTTPStatus: Int {
    
    case ok = 200
    case created = 201
    case forbidden = 403
    case badAccess = 400
    case unauthorized = 401
}
