//
//  SocialButton.swift
//  ChitChat
//
//  Created by Syed Usman on 22/04/2024.
//

import SwiftUI

struct SocialButton: View {

  let iconPath: String

  var body: some View {
    Button {

    } label: {
      Image(iconPath)
        .resizable()
        .renderingMode(.template)
        .frame(width: 30, height: 30)
        .foregroundStyle(.accent)
        .padding()
        .overlay(
          RoundedRectangle(cornerRadius: 20)
            .inset(by: 8)  // inset value should be same as lineWidth in .stroke
            .stroke(.gray.opacity(0.2), lineWidth: 2)
        )
    }
  }
}

#Preview {
  SocialButton(iconPath: "google_icon")
}
