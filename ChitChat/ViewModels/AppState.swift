//
//  AppState.swift
//  ChitChat
//
//  Created by Syed Usman on 23/04/2024.
//

import Foundation




enum Route: Hashable {
    case main
    case login
    case signUp
}

class AppState: ObservableObject {
    @Published var routes: [Route] = []
}
