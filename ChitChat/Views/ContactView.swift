//
//  MainView.swift
//  ChitChat
//
//  Created by Syed Usman on 23/04/2024.
//

import SwiftUI

struct ContactView: View {
    @EnvironmentObject private var appState: AppState
    @StateObject var authViewModel = AuthenticationViewModel()
    @State private var search: String = ""

    var body: some View {
        VStack {
            Text("Chit Chat")
                .font(.title2)
                .foregroundStyle(.accent)
                .bold()

            Text("Chats")
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)

            TextField("Search chats", text: $search)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .textFieldStyle(RoundedTextFieldStyle())
                .padding()

            ScrollView {
                VStack {
                    ForEach(0..<10) { index in
                        ChatListTile()
                    }
                }
            }
            .scrollIndicators(.hidden)
        }
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    ContactView()
}
