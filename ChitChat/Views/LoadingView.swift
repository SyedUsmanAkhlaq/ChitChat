//
//  LoadingView.swift
//  ChitChat
//
//  Created by Syed Usman on 26/04/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {
        VStack{
            ProgressView()
                .frame(width: 50, height: 50)
                .background(Circle().fill(.white))
                
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .center)
        .background(.black)
        .opacity(0.6)
            
    }
}

struct LoadingView_Previews: PreviewProvider {
    static var previews: some View {
        LoadingView()
    }
}
