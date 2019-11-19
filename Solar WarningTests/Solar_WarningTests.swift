//
//  Solar_WarningTests.swift
//  Solar WarningTests
//
//  Created by rafaeldelegate on 11/16/19.
//  Copyright © 2019 rafaeldelegate. All rights reserved.
//

import XCTest
@testable import Solar_Warning

class Solar_WarningTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testUserViewModel() {
        let user = User(name: "Rafael", skinType: 6)
        let userModel = UserViewModel(user)
        
        XCTAssertEqual(userModel.name, user.name)
        XCTAssertEqual(userModel.skinType, user.skinType)
        XCTAssertLessThanOrEqual(userModel.skinType, 6)
    }
    
   /* func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }*/
    
    

}
