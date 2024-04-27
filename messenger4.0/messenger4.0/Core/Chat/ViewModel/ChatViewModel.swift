//
//  ChatViewModel.swift
//  messenger4.0
//
//  Created by Пользователь on 23.04.2024.
//

import Foundation

class ChatViewModel: ObservableObject{
    
    @Published var messageText = ""
    @Published var messages = [Message]()
    let user: User
    
    init(user: User){
        self.user = user
        observeMessages()
    }
    
    func observeMessages(){
        MessageService.observeMessages(chatPartner: user) { messages in
            self.messages.append(contentsOf: messages)
        }
    }
    
    func sendMessage(){
        MessageService.sendMessage(messageText, toUser: user)
    }
}
