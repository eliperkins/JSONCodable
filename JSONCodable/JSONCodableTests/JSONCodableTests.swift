//
//  JSONCodableTests.swift
//  JSONCodableTests
//
//  Created by Eli Perkins on 6/16/15.
//  Copyright © 2015 matthewcheok. All rights reserved.
//

import XCTest
import JSONCodable

class JSONCodableTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testEncodable() {
        let user = User()
        
        let dict: AnyObject
        do {
            dict = try user.JSONEncode()
        } catch {
            XCTFail("Failed encoding JSON")
//            fatalError()
        }
        
        XCTAssertEqual(dict["id"], 10, "")
        XCTAssertEqual(dict["full_name"], "Matthew Cheok", "")
        XCTAssertNil(dict["email"], "")
        XCTAssertNil(dict["company"], "")
        XCTAssertEqual(dict["friends"], [], "")
    }
    
}
