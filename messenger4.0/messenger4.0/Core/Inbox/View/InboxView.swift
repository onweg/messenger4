//
//  InboxView.swift
//  Message
//
//  Created by Пользователь on 03.04.2024.
//

import SwiftUI

struct InboxView: View {
    
    @State private var showMessageView = false
    @StateObject var viewModel = InboxViewModel()
    @State private var selectedUser: User?
    @State private var showChat = false
    
    private var user: User?{
        return viewModel.currentUser
    }
    
    var body: some View {
        NavigationStack{
            List{
                ActiveNowView()
                    .listRowSeparator(.hidden)
                    .listRowInsets(EdgeInsets())
                    .padding(.vertical)
                    .padding(.horizontal, 4)
                
                ForEach(viewModel.recentMessages){ message in
                    ZStack{
                        NavigationLink(value: message){
                            EmptyView()
                        }.opacity(0.0)
                        
                        InboxRowView(message: message)
                    }
                }
            }
            .listStyle(PlainListStyle())
            .onChange(of: selectedUser, perform: { newValue in
                showChat = newValue != nil
            })
            .navigationDestination(for: Message.self, destination: { message in
                if let user = message.user{
                    ChatView(user: user)
                }
            })
            .navigationDestination(for: User.self, destination: {user in
                ProfileView(user: user)
            })
            .navigationDestination(isPresented: $showChat, destination: {
                if let user = selectedUser{
                    ChatView(user: user)
                }
            })
            .fullScreenCover(isPresented: $showMessageView, content: {
                NewMessageView(selectedUser: $selectedUser)
            })
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    HStack{
                        NavigationLink(value: user){
                            CircularProfileImageView(user: user, size: .xSmall)
                        }
                        
                        Text("Chats")
                            .font(.title)
                            .fontWeight(.semibold)
                    }
                }
                
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        showMessageView.toggle()
                        selectedUser = nil
                    }label: {
                        Image(systemName: "square.and.pencil.circle.fill")
                            .resizable()
                            .frame(width: 35, height: 35)
                            .foregroundStyle(.black, Color(.systemGray5))
                    }
                }
            }
        }
    }
}

struct InboxView_Previews: PreviewProvider {
    static var previews: some View {
        InboxView()
    }
}
