//
//  MessageService.swift
//  messenger4.0
//
//  Created by Пользователь on 23.04.2024.
//

import Foundation
import Firebase


strict MessageService{
    
    let messagesCollection = Firestore.firestore().collection("messages")
    
    func sendMessage(_ messageText: String, toUser user: User){
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let charPartnerId = user.id
        
        let currentUserRef = messagesCollection.document(currentUid).collection(charPartnerId).document()
        
        let chatPartnerRef = messagesCollection.document(charPartnerId).collection(currentUid)
        
        let messageId = currentUserRef.documentID
        
        let message = Message(messageId: messageId,
                              fromId: currentUid,
                              toId: chatPartnerId,
                              messageText: messageText,
                              timestamp: Timestamp())
        
        guard let  messageData = try? Firestore.Encoder().encode(message) else { return }
        
        currentUserRef.setData(messageData)
        chatPartnerRef.document(messageId).setData(messageData)
    }
}
