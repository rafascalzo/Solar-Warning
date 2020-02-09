//
//  Person.swift
//  Solar Warning
//
//  Created by rafaeldelegate on 11/16/19.
//  Copyright © 2019 rafaeldelegate. All rights reserved.
//

import Foundation

struct User {
    
    let name: String
    let skinType: Int
}

struct UserViewModel {
    
    let name: String
    let skinType: Int
    
    init(_ user: User) {
        self.name = user.name
        self.skinType = user.skinType
    }
}
