//
//  WelcomeView.swift
//  SwiftUILoginPage
//
//  Created by Pullur Varun on 14/09/23.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        Text("Welcome")
            .font(.system(size: 30))
            .foregroundColor(.white)
            .padding(.top, 40)
    }
}

struct WelcomeView_Previews: PreviewProvider {
    static var previews: some View {
        WelcomeView()
    }
}
