//
//  SwiftUILoginPageApp.swift
//  SwiftUILoginPage
//
//  Created by Pullur Varun on 05/09/23.
//

import SwiftUI

@main
struct SwiftUILoginPageApp: App {
    var body: some Scene {
        WindowGroup {
            LoginPageView()
                .background(
                Image("background_image_page-0001")
                    .scaledToFit()
                    .edgesIgnoringSafeArea(.all)
                )

        }
    }
}
