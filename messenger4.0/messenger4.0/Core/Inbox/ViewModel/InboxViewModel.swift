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
    
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        setupSubscribers()
    }
    private func setupSubscribers(){
        UserService.shared.$currentUser.sink {[weak self] user in
            self?.currentUser = user
        }.store(in: &cancellables)
    }
}
