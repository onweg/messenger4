//
//  InboxViewModel.swift
//  messenger4.0
//
//  Created by Пользователь on 22.04.2024.
//

import Foundation
import Combine
import Firebase

class InboxViewModel: ObservableObject{
    @Published var currentUser: User?
    @Published var recentMessages = [Message]()
    
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        setupSubscribers()
    }
    private func setupSubscribers(){
        UserService.shared.$currentUser.sink {[weak self] user in
            self?.currentUser = user
        }.store(in: &cancellables)
        
        InboxService().$documentChanges.sink { [weak self] changes in
            
        }
    }
    
    private func loadInitialMessages (fromChanges changes: [DocumentChange]){
        var messages = changes.compactMap({ try $0.document.data(as: Message.self) })
        
        for i in 0 ..< messages.count {
            let message - messages[i]
            
            
        }
    }
}
