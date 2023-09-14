//
//  ContentView.swift
//  SwiftUILoginPage
//
//  Created by Pullur Varun on 05/09/23.
//

import SwiftUI


struct LoginPageView: View {
    @StateObject var viewModel = LoginPageViewModel()
    @State private var isPasswordVisible: Bool = false
    @State private var isLoggedIn: Bool = false
    
    var isiPad: Bool {
        return UIDevice.current.userInterfaceIdiom == .pad
    }

    var body: some View {
        VStack {
            Text("Sign Up")
                .font(.system(size: 30))
                .foregroundColor(.white)
                .padding(.top, 40)
            
            CustomeTextView(text: $viewModel.username, placeholder: "Username")
                .padding(.horizontal, isiPad ? 200 : -13)
                .padding(.top, 10)
            
            CustomeTextView(text: $viewModel.password, placeholder: "Password", isSecure: !isPasswordVisible)
                .padding(.top, 25)
                .overlay(
                    Button {
                        isPasswordVisible.toggle()
                    } label: {
                        Image(systemName: !isPasswordVisible ? "eye.fill" : "eye.slash.fill")
                            .foregroundColor(.gray)
                            .padding(.trailing, 15)
                    }
                    .padding(.top, 40)
                    ,alignment: .trailing
                )
                .padding(.horizontal, isiPad ? 200 : -13)
            
            Button{
                let credentials = "\(viewModel.username):\(viewModel.password)"
                let base64credentials = credentials.data(using: .utf8)?.base64EncodedString()
                viewModel.validateUser(base64string: base64credentials ?? "") { success in
                    if success {
                        isLoggedIn = true
                    } else {
                        isLoggedIn = false
                    }
                }
                
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
            .disabled(viewModel.username.isEmpty || viewModel.password.isEmpty)
            .opacity(viewModel.username.isEmpty || viewModel.password.isEmpty ? 0.6 : 0.9)
            
            Button{} label: {
                Text("Forgot Password?")
                    .font(.subheadline)
                    .foregroundColor(.white)
            }
            .padding(.top, 30)
            Spacer()
        }
        .padding()
        .fullScreenCover(isPresented: $isLoggedIn, content: {
            WelcomeView()
                .background(
                    Image("background_image_page-0001")
                    .scaledToFit()
                    .edgesIgnoringSafeArea(.all)
                )
        })
    }
}

struct LoginPageView_Previews: PreviewProvider {
    static var previews: some View {
        LoginPageView()
    }
}
