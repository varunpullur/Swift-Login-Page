//
//  Response.swift
//  SwiftUILoginPage
//
//  Created by Pullur Varun on 14/09/23.
//

import Foundation

struct Response: Decodable {
    let token: String
    let expiresOn: String
    
    func getToken() -> String {
        return token
    }

    func getExpiresOn() -> String {
        return expiresOn
    }
}
