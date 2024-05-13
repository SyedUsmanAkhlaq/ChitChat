//
//  AppUser.swift
//  ChitChat
//
//  Created by Syed Usman on 22/04/2024.
//

import Foundation


struct AppUser: Codable, Identifiable {
    let id: String
    let firstName: String
    let lastName: String
    let email: String
    let userImageURL: String


    init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(String.self, forKey: .id)
        self.firstName = try container.decode(String.self, forKey: .firstName)
        self.lastName = try container.decode(String.self, forKey: .lastName)
        self.email = try container.decode(String.self, forKey: .email)
        self.userImageURL = try container.decode(String.self, forKey: .userImageURL)
    }


    enum CodingKeys: String, CodingKey {
        case id = "id"
        case firstName = "first_name"
        case lastName = "last_name"
        case email = "email"
        case userImageURL = "user_image_url"
    }
}
