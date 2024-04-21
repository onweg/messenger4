//
//  ShapeMessage.swift
//  Message
//
//  Created by Пользователь on 09.04.2024.
//

import SwiftUI

struct ShapeMessage: Shape {
    
    let isFromCurrentUser: Bool
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect,
                                byRoundingCorners: [
                                    .topLeft,
                                    .topRight,
                                    isFromCurrentUser ? .bottomLeft : .bottomRight
                                ],
                                cornerRadii: CGSize(width: 16, height: 16))
        
        return Path(path.cgPath)
    }
}

struct ShapeMessage_Previews: PreviewProvider {
    static var previews: some View {
        ShapeMessage(isFromCurrentUser: false)
    }
}
