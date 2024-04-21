//
//  ContentViewModel.swift
//  messenger4.0
//
//  Created by Пользователь on 21.04.2024.
//

import Firebase
import Combine

class ContentViewModel: ObservableObject{
    
    @Published var userSession: FirebaseAuth.User?
    
    private var cancellables = Set<AnyCancellable>()
    
    init(){
        setupSubscribers()
    }
    
    private func setupSubscribers(){
        AuthService.shared.$userSession.sink {[weak self] userSessionFromAuthService in
            self?.userSession = userSessionFromAuthService
        }.store(in: &cancellables)
    }
    
}
