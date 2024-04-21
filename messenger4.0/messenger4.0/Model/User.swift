//
//  User.swift
//  Message
//
//  Created by Пользователь on 08.04.2024.
//

import Foundation
import FirebaseFirestoreSwift

struct User: Codable, Identifiable, Hashable {
    
    @DocumentID var uid: String?
    //var id = NSUUID().uuidString
    var id: String{
        return uid ?? NSUUID().uuidString
    }
    
    let fullname: String
    let email: String
    var profileImageURL: String?
    
    
}


extension User{
    static let MOCK_USER = User(fullname: "Arkadiy Frolkin", email: "gmail@gmail.com" , profileImageURL: "userImage")
}
