//
//  CustomeTextView.swift
//  SwiftUILoginPage
//
//  Created by Pullur Varun on 13/09/23.
//

import SwiftUI

struct CustomeTextView: View {
    @Binding var text: String
    var placeholder: String
    var isSecure: Bool = false
    
    var body: some View {
        VStack{
            if isSecure {
                SecureField(placeholder, text: $text, prompt: Text(placeholder).foregroundColor(.white))
                    .tint(.white)
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                    .foregroundColor(.white)
            } else {
                TextField(placeholder, text: $text, prompt: Text(placeholder).foregroundColor(.white))
                    .tint(.white)
                    .autocapitalization(.none)
                    .autocorrectionDisabled()
                    .foregroundColor(.white)
            }
            Rectangle()
                .frame(height: 1.5)
                .foregroundColor(.white)
        }
        .padding()
        .padding(.bottom, -20)
    }
}

struct CustomeTextView_Previews: PreviewProvider {
    static var previews: some View {
        CustomeTextView(text: .constant("text"), placeholder: "username")
    }
}
