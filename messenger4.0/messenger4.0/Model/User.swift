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
    
    var firstName: String{
        let formatter = PersonNameComponentsFormatter()
        let components = formatter.personNameComponents(from: fullname)
        return components?.givenName ?? fullname
    }
}


extension User{
    static let MOCK_USER = User(fullname: "Arkadiy Frolkin", email: "gmail@gmail.com" , profileImageURL: "userImage")
}
