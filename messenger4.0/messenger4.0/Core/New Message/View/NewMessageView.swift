//
//  NewMessageView.swift
//  Message
//
//  Created by Пользователь on 05.04.2024.
//

import SwiftUI

struct NewMessageView: View {
    
    @State private var searchText = ""
    @Environment(\.dismiss) var disiss
    
    var body: some View {
        NavigationStack{
            ScrollView{
                TextField("To: ", text: $searchText)
                    .frame(height: 44)
                    .padding(.leading)
                    .background(Color(.systemGroupedBackground))
                
                Text("CONTACTS")
                    .foregroundColor(.gray)
                    .font(.footnote)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                
                ForEach(0 ... 10, id: \.self){ user in
                    VStack{
                        HStack{
                            CircularProfileImageView(user: User.MOCK_USER, size: .small)
                            
                            Text("User name")
                                .font(.subheadline)
                                .fontWeight(.semibold)
                            
                            Spacer()
                        }
                        .padding(.leading)
                        
                        Divider()
                            .padding(.leading)
                    }
                }
            }
            .navigationTitle("New Message")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    Button("Cancel"){
                        disiss()
                    }
                    .foregroundColor(.black)
                }
            }
        }
    }
}

struct NewMessageView_Previews: PreviewProvider {
    static var previews: some View {
        NewMessageView()
    }
}
