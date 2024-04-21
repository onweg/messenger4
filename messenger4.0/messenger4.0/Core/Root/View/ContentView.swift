//
//  ContentView.swift
//  Message
//
//  Created by Пользователь on 03.04.2024.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject var viewModel = ContentViewModel()
    
    var body: some View {
        Group{
            if viewModel.userSession != nil{
                InboxView()
            }else{
                LoginView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
