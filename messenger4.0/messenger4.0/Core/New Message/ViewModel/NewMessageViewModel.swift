//
//  NewMessageViewModel.swift
//  messenger4.0
//
//  Created by Пользователь on 23.04.2024.
//

import Foundation

class NewMessageViewModel: ObservableObject{
    @Published var users = [User]()
    
    init(){
        Task {try await fetchUsers() }
    }
    
    func fetchUsers() async throws {
        self.users = try await UserService.fetchAllUsers()
    }
}
