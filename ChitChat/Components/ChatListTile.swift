//
//  ChatListTile.swift
//  ChitChat
//
//  Created by Syed Usman on 29/04/2024.
//

import SwiftUI

struct ChatListTile: View {
    var body: some View {
        HStack {

            ImageView(imageURL: "https://avatarfiles.alphacoders.com/371/371450.jpg")

            VStack(alignment: .leading) {
                Text("Syed Usman")
                    .font(.title3)
                    .foregroundStyle(.black)

//                Spacer()
//                    .frame(height: 8)

                Text("I will be waiting for the update from you.\nIn the mean time I will look for the document.")
                    .font(.caption)
                    .foregroundStyle(.gray)
            }
        }
        .padding(.vertical,8)
    }
}

#Preview {
    ChatListTile()
}
