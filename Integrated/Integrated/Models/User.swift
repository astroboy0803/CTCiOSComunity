//
//  User.swift
//  Integrated
//
//  Created by i9400506 on 2022/1/5.
//

import Foundation

struct User: Codable {
    
    struct Company: Codable {
        var name: String
        let catchPhrase: String
    }
    
    struct Address: Codable {
        let street: String
        let suite: String
        let city: String
        let zipcode: String
    }
    
    let id: Int
    var name: String
    var email: String
    var phone: String
    var company: Company
    let address: Address
    let website: String
}
