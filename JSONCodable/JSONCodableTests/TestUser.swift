//
//  TestUser.swift
//  JSONCodable
//
//  Created by Eli Perkins on 6/16/15.
//  Copyright © 2015 matthewcheok. All rights reserved.
//

import Foundation
import JSONCodable

struct User {
    var id: Int = 10
    var name: String = "Matthew Cheok"
    var email: String?
    var company: Company?
    var friends: [User] = []
}

struct Company {
    var name: String = ""
    var address: String?
}

extension User: JSONEncodable {
    func JSONEncode() throws -> AnyObject {
        var result: [String: AnyObject] = [:]
        try result.archive(id, key: "id")
        try result.archive(name, key: "full_name")
        try result.archive(email, key: "email")
        try result.archive(company, key: "company")
        try result.archive(friends, key: "friends")
        return result
    }
}

extension Company: JSONEncodable {}

extension User: JSONDecodable {
    mutating func JSONDecode(JSONDictionary: [String : AnyObject]) {
        JSONDictionary.restore(&id, key: "id")
        JSONDictionary.restore(&name, key: "full_name")
        JSONDictionary.restore(&email, key: "email")
        JSONDictionary.restore(&company, key: "company")
        JSONDictionary.restore(&friends, key: "friends")
    }
}

extension Company: JSONDecodable {
    mutating func JSONDecode(JSONDictionary: [String : AnyObject]) {
        JSONDictionary.restore(&name, key: "name")
        JSONDictionary.restore(&address, key: "address")
    }
}
