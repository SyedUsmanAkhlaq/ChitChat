//
//  AuthenticationViewModel.swift
//  ChitChat
//
//  Created by Syed Usman on 22/04/2024.
//

import Firebase
import FirebaseAuth
import FirebaseStorage
import FirebaseFirestore
import Foundation


class AuthenticationViewModel: ObservableObject {

    @Published var user: AppUser?
    @Published var isLoading = false

    private let auth = Auth.auth()
    private let firestore = Firestore.firestore()
    private let firebaseStorage = FirebaseStorage.Storage.storage()

    //    @MainActor
    func login(email: String, password: String)async -> Bool {
        do {
            isLoading = true
            let result = try await auth.signIn(withEmail: email, password: password)

            let data = try? await self.firestore.collection("users").document(result.user.uid).getDocument()

            if data != nil {
                self.user = try? data?.data(as: AppUser.self)
                print(String(describing: self.user))
            }

            isLoading = false
            return true

        } catch {
            print(error.localizedDescription)
            isLoading = false
            return false
        }
    }

    func register(firstName: String, lastName: String, email: String, password: String, image: UIImage?) async -> Bool {
        do {
            isLoading = true
            let result = try? await auth.createUser(withEmail: email, password: password)

            print("Registered User UID: \(String(describing: result?.user.uid))")



            if result?.user.uid != nil {
//                try? await self.firestore.collection("users").document(result!.user.uid).setData(userData)
                guard let image = image,
                    let imageData = image.jpegData(compressionQuality: 0.5) else {
                    return false
                }

                let storageRef = Storage.storage().reference().child(Date.now.timeIntervalSince1970.description)
                _ = try await storageRef.putDataAsync(imageData)
                let imageURL: URL? = try? await storageRef.downloadURL()

                let userData: [String: String] = [
                    "id": result?.user.uid ?? "",
                    "first_name": firstName,
                    "last_name": lastName,
                    "email": email,
                    "user_image_url": imageURL?.absoluteString ?? "",
                ]

                try await self.firestore.collection("users").document(result!.user.uid).setData(userData)

                let data = try? await self.firestore.collection("users").document(result!.user.uid).getDocument()

                if data != nil {
                    self.user = try? data?.data(as: AppUser.self)
                    print(String(describing: self.user))
                }
                isLoading = false
            }else {
                isLoading = false
                return false
            }
            return true
        } catch {
            print(error.localizedDescription)
            isLoading = false
            return false
        }
    }
}
