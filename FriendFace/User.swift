//
//  User.swift
//  FriendFace
//
//  Created by Şiyar Palabıyık on 21.12.2024.
//

import Foundation



struct User : Codable, Equatable, Hashable{
    let id : String
    let isActive : Bool
    let name : String
    let age : Int
    let company : String
    let address : String
    let about : String
    let registered : String
    let tags : [String]
    let email : String
    let friends : [Friends]
    
}

struct Friends : Codable, Equatable, Hashable{
    let id : String
    let name : String
}


