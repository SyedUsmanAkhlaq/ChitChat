//
//  RoundedTextFieldStyle.swift
//  ChitChat
//
//  Created by Syed Usman on 22/04/2024.
//

import SwiftUI

// Structure creating a custom TextFieldStyle.
struct RoundedTextFieldStyle: TextFieldStyle {
  func _body(configuration: TextField<Self._Label>) -> some View {
    configuration
      .padding()
      .overlay(
        RoundedRectangle(cornerRadius: 15)
          .stroke(Color.accentColor, lineWidth: 2)
      )
  }
}

//#Preview {
//    RoundedTextFieldStyle()
//}
