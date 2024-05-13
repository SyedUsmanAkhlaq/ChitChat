//
//  LoginView.swift
//  ChitChat
//
//  Created by Syed Usman on 22/04/2024.
//

import SwiftUI

struct LoginView: View {

    @StateObject var authViewModel = AuthenticationViewModel()
    @State private var email: String = "usman.akhlaq@purelogics.net"
    @State private var password: String = "12345678"
    @EnvironmentObject private var appState: AppState

    var body: some View {

        ZStack {
            VStack {

                Image(systemName: "message.badge.circle.fill")
                    .resizable()
                    .frame(width: 90, height: 90)
                    .foregroundStyle(.accent)
                    .padding(.top, 40)

                Text("Login to your account to chat with others")
                    .font(.title3)
                    .padding(.top, 20)

                HStack {
                    Text("First time here?")
                        .font(.callout)
                        .foregroundStyle(.gray)

                    Button {
                        appState.routes.append(.signUp)
                        print("AppState: \(appState.routes)")
                    } label: {
                        Text("Register")
                            .bold()
                    }
                        .foregroundStyle(.accent)
                        .bold()
                }

                TextField("Email", text: $email)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .textFieldStyle(RoundedTextFieldStyle())
                    .padding()

                TextField("Password", text: $password)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                    .textFieldStyle(RoundedTextFieldStyle())
                    .padding(.horizontal)

                Spacer()

                Button {
                    Task {
                        await loginUser()
                    }
                } label: {
                    Text("Login")
                        .font(.title3)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                        .frame(maxWidth:  .infinity , maxHeight: 55)
                        .background(.accent)
                        .clipShape(.buttonBorder)
                        .padding()
                }

                LabelDivider(label: "or sign in with")
                    .padding(.horizontal)

                HStack {
                    SocialButton(iconPath: "google_icon")

                    SocialButton(iconPath: "facebook_icon")
                }
                    .padding(.horizontal)

            }
                .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
                .navigationBarBackButtonHidden()
        }

//        if authViewModel.isLoading {
            LoadingView()
//        }
        
    }

    // Functions
    private func loginUser()async {
        let success = await authViewModel.login(email: email, password: password)
        if success {
            appState.routes.append(.main)
        } else {
            print("Couldn't Login")
        }

    }
}

#Preview {
    LoginView()
}
