//
//  ChitChatApp.swift
//  ChitChat
//
//  Created by Syed Usman on 22/04/2024.
//

import SwiftUI
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct ChitChatApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @StateObject private var appState = AppState()
    
    var body: some Scene {
        WindowGroup {
            NavigationStack(path: $appState.routes) {
                            ZStack {
                             
                                    RegisterView()
                    
                            }.navigationDestination(for: Route.self) { route in
                                switch route {
                                    case .main:
                                        ContactView()
                                    case .login:
                                        LoginView()
                                    case .signUp:
                                        RegisterView()
                                }
                            }
                            
                        }
                        .environmentObject(appState)
        }
    }
}
