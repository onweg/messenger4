//
//  SettingOptionViewModel.swift
//  Message
//
//  Created by Пользователь on 05.04.2024.
//


import SwiftUI

enum SettingOptionViewModel: Int, CaseIterable, Identifiable{
    case darkMode
    case activeStatus
    case accessibility
    case privacy
    case notification
    
    var title: String {
        switch self{
        case .darkMode: return "Dark mode"
            
        case .activeStatus: return "Active status"
            
        case .accessibility: return "Acceddibility"
            
        case .privacy: return "Privacy and Safety"
            
        case .notification: return "Notifications"
            
        }
    
    }
    
    var imageName: String{
        switch self{
            
        case .darkMode: return "moon.circle.fill"
        case .activeStatus: return "message.badge.circle.fill"
        case .accessibility: return "person.circle.fill"
        case .privacy: return "lock.circle.fill"
        case .notification: return "bell.circle.fill"
        }
    }
    
    var imageBackgroundColor: Color{
        switch self{
            
        case .darkMode: return Color.black
        case .activeStatus: return Color(.systemGreen)
        case .accessibility: return Color.black
        case .privacy: return Color(.systemBlue)
        case .notification: return Color(.systemPurple)
        }
    }
    
    var id: Int {return self.rawValue}
}
