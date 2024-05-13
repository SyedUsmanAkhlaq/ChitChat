//
//  SearchView.swift
//  ChitChat
//
//  Created by Syed Usman on 29/04/2024.
//

import SwiftUI

struct SearchView: View {
    
    @State private var search: String = ""
    
    var body: some View {
        VStack {
            Text("Chit Chat")
                .font(.title2)
                .foregroundStyle(.accent)
                .bold()

            Text("Search")
                .font(.title)
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            TextField("Search people", text: $search)
                .autocorrectionDisabled()
                .textInputAutocapitalization(.never)
                .textFieldStyle(RoundedTextFieldStyle())
                .padding()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .top)
    }
}

#Preview {
    SearchView()
}
