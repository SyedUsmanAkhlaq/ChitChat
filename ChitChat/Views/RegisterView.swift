//
//  RegisterView.swift
//  ChitChat
//
//  Created by Syed Usman on 22/04/2024.
//

import PhotosUI
import SwiftUI

struct RegisterView: View {

    @State private var firstName: String = "Usman"
    @State private var lastName: String = "Akhlaq"
    @State private var email: String = "usman.akhlaq+3@purelogics.net"
    @State private var password: String = "12345678"
    @State private var confirmPassword: String = "12345678"

    @State private var image = UIImage()
    @State private var showSheet = false

    @EnvironmentObject private var appState: AppState
    @StateObject var authViewModel = AuthenticationViewModel()



    var body: some View {
        ZStack {

            ScrollView {
                LazyVStack {

                    Text("Register to chat with others")
                        .font(.title3)
                        .padding(.top, 20)

                    HStack {
                        Text("Already got account?")
                            .font(.callout)
                            .foregroundStyle(.gray)

                        Button {
                            appState.routes.append(.login)
                        } label: {
                            Text("Login")
                                .bold()
                        }
                    }
                    
                    Image(uiImage: self.image)
                        .resizable()
                        .cornerRadius(50)
                        .padding(.all, 4)
                        .frame(width: 100, height: 100)
                        .background(Color.black.opacity(0.2))
                        .aspectRatio(contentMode: .fill)
                        .clipShape(Circle())
                        .padding(8)
                        .onTapGesture {
                        showSheet = true
                    }

                    TextField("First Name", text: $firstName)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                        .textFieldStyle(RoundedTextFieldStyle())
                        .padding(.horizontal)
                        .padding(.vertical, 12)

                    TextField("Last Name", text: $lastName)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                        .textFieldStyle(RoundedTextFieldStyle())
                        .padding(.horizontal)
                        .padding(.bottom, 12)

                    TextField("Email", text: $email)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                        .textFieldStyle(RoundedTextFieldStyle())
                        .padding(.horizontal)
                        .padding(.bottom, 12)

                    TextField("Password", text: $password)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                        .textFieldStyle(RoundedTextFieldStyle())
                        .padding(.horizontal)
                        .padding(.bottom, 12)

                    TextField("Confirm Password", text: $confirmPassword)
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.never)
                        .textFieldStyle(RoundedTextFieldStyle())
                        .padding(.horizontal)

                    Button {
                        Task {
                           await register()
                        }
                    } label: {
                        Text("Register")
                            .font(.title3)
                            .fontWeight(.semibold)
                            .foregroundStyle(.white)
                            .padding()
                            .frame(maxWidth: /*@START_MENU_TOKEN@*/ .infinity /*@END_MENU_TOKEN@*/, maxHeight: 55)
                            .background(.accent)
                            .clipShape(.buttonBorder)
                            .padding()
                    }

                    LabelDivider(label: "or sign up with")
                        .padding(.horizontal)

                    HStack {
                        SocialButton(iconPath: "google_icon")

                        SocialButton(iconPath: "facebook_icon")
                    }
                        .padding(.horizontal)

                }
                    .navigationBarBackButtonHidden()
                    .sheet(isPresented: $showSheet) {
                    ImagePicker(sourceType: .photoLibrary, selectedImage: self.$image)
                }
            }
        }
        if authViewModel.isLoading {
            LoadingView()
        }
    }
    
    func register() async{
        let success = await authViewModel.register(firstName: firstName, lastName: lastName, email: email, password: password, image: image)
        if success {
            appState.routes.append(.main)
        }
    }
}

#Preview {
    RegisterView()
}
