//
//  ChatViewModel.swift
//  messenger4.0
//
//  Created by Пользователь on 23.04.2024.
//

import Foundation

class ChatViewModel: ObservableObject{
    
    @Published var messageText = ""
    let user: User
    
    init(user: User){
        self.user = user
    }
    
    func sendMessage(){
        MessageService.sendMessage(messageText, toUser: user)
    }
}
