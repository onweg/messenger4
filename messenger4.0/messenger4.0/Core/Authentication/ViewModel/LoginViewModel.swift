//
//  LoginViewModel.swift
//  Message
//
//  Created by Пользователь on 11.04.2024.
//

import SwiftUI

class LoginViewModel: ObservableObject{
    
    @Published var email = ""
    @Published var password = ""
    
    func login() async throws{
        try await AuthService.shared.login(withEmail: email, password: password)
    }
    
}
