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
    
    let service: ChatService
    
    init(user: User){
        self.service = ChatService(chatPartner: user)
        observeMessages()
    }
    
    func observeMessages(){
        service.observeMessages() { messages in
            self.messages.append(contentsOf: messages)
        }
    }
    
    func sendMessage(){
        service.sendMessage(messageText)
    }
}
