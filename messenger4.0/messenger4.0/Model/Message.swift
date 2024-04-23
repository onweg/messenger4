//
//  Message.swift
//  messenger4.0
//
//  Created by Пользователь on 23.04.2024.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

struct Message: Identifiable, Codable, Hashable{
    @DocumentID var messageId: String?
    
    var id: String{
        return messageId ?? NSUUID().uuidString
    }
    
    let fromId: String // от кого сообщение
    let tiId: String // кому сообщение
    let messageText: String //текст сообщения
    let timestamp: Timestamp // время отправки сообщения (временная метка)
    
    var user: User? //пользователь связанный с сообщением
    
    var chatPartnerId: String{
        return fromId == Auth.auth().currentUser?.uid ? toId : fromId
    }
    
    var isFromCurrentUser: Bool{
        return fromId == Auth.auth().currentUser?.uid
    }
}
