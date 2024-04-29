//
//  Route.swift
//  messenger4.0
//
//  Created by Пользователь on 30.04.2024.
//

import Foundation

enum Route: Hashable{
    case profile(User)
    case chatView(User)
}
