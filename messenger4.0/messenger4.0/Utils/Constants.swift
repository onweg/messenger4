//
//  Constants.swift
//  messenger4.0
//
//  Created by Пользователь on 29.04.2024.
//

import Foundation
import Firebase

struct FirestoreConstants{
    static let UserCollection = Firestore.firestore().collection("users")
    static let MessagesCollection = Firestore.firestore().collection("messages")
}
