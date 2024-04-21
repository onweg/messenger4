//
//  RegistrationViewModel.swift
//  Message
//
//  Created by Пользователь on 11.04.2024.
//

import SwiftUI

class RegistrationViewModel: ObservableObject{
    
    @Published var email = ""
    @Published var password = ""
    @Published var fullname = ""
    
    func createUser() async throws{
        let authService = AuthService.shared
        try await authService.createUser(withEmail: email, password: password, fullname: fullname)
    }
}
