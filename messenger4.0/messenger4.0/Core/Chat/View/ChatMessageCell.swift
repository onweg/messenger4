//
//  ChatMessageCell.swift
//  Message
//
//  Created by Пользователь on 09.04.2024.
//

import SwiftUI

struct ChatMessageCell: View {
    
    let message: Message
    
    private var isFromCurrentUser: Bool{
        return message.isFromCurrentUser
    }
    
    var body: some View {
        HStack{
            if isFromCurrentUser{
                Spacer()
                Text(message.messageText)
                    .font(.subheadline)
                    .padding(12)
                    .background(Color(.systemBlue))
                    .foregroundColor(.white)
                    .clipShape(ShapeMessage(isFromCurrentUser: isFromCurrentUser))
                    .frame(maxWidth: UIScreen.main.bounds.width / 1.5, alignment: .trailing)
            }else{
                HStack(alignment: .bottom, spacing: 8){
                    CircularProfileImageView(user: User.MOCK_USER, size: .xxSmall)
                    
                    Text(message.messageText)
                        .font(.subheadline)
                        .padding(12)
                        .background(Color(.systemGray4))
                        .foregroundColor(.black)
                        .clipShape(ShapeMessage(isFromCurrentUser: isFromCurrentUser))
                        .frame(maxWidth: UIScreen.main.bounds.width / 1.75, alignment: .leading)
                    
                    Spacer()
                }
                
            }
        }
        .padding(.horizontal, 8)
    }
}

//struct ChatMessageCell_Previews: PreviewProvider {
//    static var previews: some View {
//        ChatMessageCell(isFromCurrentUser: true)
//    }
//}
