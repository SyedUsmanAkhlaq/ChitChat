//
//  LabelDivider.swift
//  ChitChat
//
//  Created by Syed Usman on 22/04/2024.
//

import SwiftUI

struct LabelDivider: View {

  let label: String
  let horizontalPadding: CGFloat
  let color: Color

  init(label: String, horizontalPadding: CGFloat = 8, color: Color = Color(UIColor.separator)) {
    self.label = label
    self.horizontalPadding = horizontalPadding
    self.color = color
  }

  var body: some View {
    HStack(alignment: .center, spacing: 0) {
      line
      Text(label)
        .font(.callout)
        .foregroundColor(color)
        .lineLimit(1)
        .fixedSize()
        .offset(y: -1)
      line
    }
  }

  var line: some View {
    VStack { Divider().frame(height: 1).background(color) }.padding(horizontalPadding)
  }
}

#Preview {
  LabelDivider(label: "Test")
}
