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
    @State private var message: String = ""
    
    var isiPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }

    var body: some View {
        VStack {
            Text("Sign Up")
                .font(.largeTitle)
                .padding(.top, 40)
                .padding(.bottom, 80)
            
            TextField("Username", text: $username)
                .modifier(LoginTextFieldStyle())
                .frame(width: isiPad ? 400 : nil)
            
            SecureField("Password", text: $password)
                .modifier(LoginTextFieldStyle())
                .frame(width: isiPad ? 400 : nil)
            
            Button{
                if username == "admin" && password == "admin" {
                    message = "Login Successful"
                } else if username.isEmpty || password.isEmpty {
                    message = "Please enter all the fields"
                } else {
                    message = "Invalid username or password"
                }
                                
            } label: {
                Text("Login")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 220, height: 60)
                    .background(Color.blue)
                    .cornerRadius(15.0)
            }
               
            Text(message)
                .foregroundColor(message == "Login Successful" ? .green : .red)
                .padding()
            
            Button{} label: {
                Text("Forgot Password?")
                    .font(.subheadline)
                    .foregroundColor(.blue)
            }
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

struct LoginTextFieldStyle: ViewModifier {
    func body(content: Content) -> some View {
        content
            .autocapitalization(.none)
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(5.0)
            .padding(.bottom, 20)
            .padding(.horizontal, 20)
    }
}
