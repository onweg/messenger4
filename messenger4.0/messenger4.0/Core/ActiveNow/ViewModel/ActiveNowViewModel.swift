//
//  ActiveNowViewModel.swift
//  messenger4.0
//
//  Created by Пользователь on 30.04.2024.
//

import Foundation

class ActiveNowViewModel: ObservableObject{
    @Published var users = [User]()
    
    init(){
        Task { try await fetchUsers()}
    }
    @MainActor
    private func fetchUsers() async throws {
        self.users = try await UserService.fetchAllUsers(limit: 10)
    }
}
