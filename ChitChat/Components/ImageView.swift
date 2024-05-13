//
//  ImageView.swift
//  ChitChat
//
//  Created by Syed Usman on 29/04/2024.
//

import SwiftUI

struct ImageView: View {
    let imageURL: String

    var body: some View {
        AsyncImage(url: URL(string: imageURL)) { phase in
            if let image = phase.image {
                image
                    .resizable()
                    .frame(width: 70, height: 70)
                    .clipShape(.circle) // Displays the loaded image.
            } else if phase.error != nil {
                Image(systemName: "person.circle.fill")
                    .resizable()
                    .frame(width: 70, height: 70)
                    .clipShape(.circle) // Indicates an error.
            } else {
                ProgressView()
                    .frame(width: 70, height: 70) // Acts as a placeholder.
            }
        }
    }
}

#Preview {
    ImageView(imageURL: "https://images.unsplash.com/photo-1535713875002-d1d0cf377fde?q=80&w=2960&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D")
}
