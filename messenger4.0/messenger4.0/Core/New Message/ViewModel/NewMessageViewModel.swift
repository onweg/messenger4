//
//  NewMessageViewModel.swift
//  messenger4.0
//
//  Created by Пользователь on 23.04.2024.
//

import Foundation
import Firebase

@MainActor
class NewMessageViewModel: ObservableObject{
    @Published var users = [User]()
    
    init(){
        Task {try await fetchUsers() }
    }
    
    func fetchUsers() async throws {
        guard let currentUid = Auth.auth().currentUser?.uid else { return }
        let users = try await UserService.fetchAllUsers()
        self.users = users.filter({$0.id != currentUid})
    }
}
