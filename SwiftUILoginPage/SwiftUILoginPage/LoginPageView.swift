//
//  ContentView.swift
//  SwiftUILoginPage
//
//  Created by Pullur Varun on 05/09/23.
//

import SwiftUI


struct LoginPageView: View {
    @State private var username: String = ""
    @State private var password: String = ""
    @State private var isPasswordVisible: Bool = false
    
    var isiPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }

    var body: some View {
        VStack {
            Text("Sign Up")
                .font(.system(size: 30))
                .foregroundColor(.white)
                .padding(.top, 40)
            
            CustomeTextView(text: $username, placeholder: "Username")
                .padding(.horizontal, isiPad ? 200 : -13)
                .padding(.top, 10)
            
            CustomeTextView(text: $password, placeholder: "Password", isSecure: !isPasswordVisible)
                .padding(.top, 10)
                .overlay(
                    Button {
                        isPasswordVisible.toggle()
                    } label: {
                        Image(systemName: !isPasswordVisible ? "eye.slash.fill" : "eye.fill")
                            .foregroundColor(.gray)
                            .padding(.trailing, 15)
                    }
                    .padding(.bottom, 4)
                    .padding(.top, 20)
                    ,alignment: .trailing
                )
                .padding(.horizontal, isiPad ? 200 : -13)
            
            Button{
                print("username: \(username) \npassword: \(password)" )
            } label: {
                Text("Login")
                    .font(.headline)
                    .foregroundColor(.pink)
                    .padding()
                    .frame(width: 280, height: 50)
                    .background(Color.white)
                    .cornerRadius(7.0)
            }
            .padding(.top, 45)
            .disabled(username.isEmpty || password.isEmpty)
            .opacity(username.isEmpty || password.isEmpty ? 0.6 : 0.9)
            
            Button{} label: {
                Text("Forgot Password?")
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
            .padding(.top, 30)
            Spacer()
        }
        .padding()
    }
}

struct LoginPageView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPageView()
    }
}
