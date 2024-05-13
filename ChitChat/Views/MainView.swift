//
//  MainView.swift
//  ChitChat
//
//  Created by Syed Usman on 29/04/2024.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            ContactView()
                .tabItem {
                    Label("Chats", systemImage: "message.fill")
                }
            
            SearchView()
                .tabItem {
                    Label("Search", systemImage: "magnifyingglass")
            } 
            
            ProfileView()
                .tabItem {
                Label("Profile", systemImage: "person.crop.circle.fill")
            }
        }
    }
}

#Preview {
    MainView()
}
