//
//  User.swift
//  FriendFace
//
//  Created by Şiyar Palabıyık on 21.12.2024.
//

import Foundation
import SwiftData

@Model class User: Codable {
    
    enum CodingKeys: CodingKey {
       case id
       case isActive
       case name
       case age
       case company
       case address
       case about
       case registered
       case tags
       case email
       case friends

    }
    
    var id: String
    var isActive: Bool
    var name: String
    var age: Int
    var company: String
    var address: String
    var about: String
    var registered: String
    var tags: [String]
    var email: String
    var friends: [Friends]


    init(id: String, isActive: Bool, name: String, age: Int, company: String, address: String, about: String, registered: String, tags: [String], email: String, friends: [Friends]) {
        self.id = id
        self.isActive = isActive
        self.name = name
        self.age = age
        self.company = company
        self.address = address
        self.about = about
        self.registered = registered
        self.tags = tags
        self.email = email
        self.friends = friends
    }
    required init(from decoder: any Decoder) throws {
        let containter = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try containter.decode(String.self, forKey: .id)
        self.isActive = try containter.decode(Bool.self, forKey: .isActive)
        self.name = try containter.decode(String.self, forKey: .name)
        self.age = try containter.decode(Int.self, forKey: .age)
        self.company = try containter.decode(String.self, forKey: .company)
        self.address = try containter.decode(String.self, forKey: .address)
        self.about = try containter.decode(String.self, forKey: .about)
        self.registered = try containter.decode(String.self, forKey: .registered)
        self.tags = try containter.decode([String].self, forKey: .tags)
        self.email = try containter.decode(String.self, forKey: .email)
        self.friends = try containter.decode([Friends].self, forKey: .friends)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

    }
}

@Model class Friends: Codable, Equatable, Hashable {
    
    enum CodingKeys : CodingKey{
        case id
        case name
    }
    var id: String
    var name: String
    
    init(id: String, name: String) {
        self.id = id
        self.name = name
    }
    
    required init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.name = try container.decode(String.self, forKey: .name)
        self.id = try container.decode(String.self, forKey: .id)
    }
    
    func encode(to encoder: any Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
    }
}
