//
//  LoginPageViewModel.swift
//  SwiftUILoginPage
//
//  Created by Pullur Varun on 14/09/23.
//

import Foundation
import Alamofire

class LoginPageViewModel: ObservableObject {
    @Published var username = ""
    @Published var password = ""
    @Published var tokenResponse: Response?
    
    func validateUser(base64string: String, completion: @escaping (Bool) -> Void){
        let base64encoded = base64string
        let headers: HTTPHeaders = [
            "Authorization": "Basic \(base64encoded)",
            "X-Nspire-AppToken": "f07740dc-1252-48f3-9165-c5263bbf373c"
        ]
        
        AF.request("https://identity-stage.spireon.com/identity/token",headers: headers )
            .responseDecodable(of: Response.self) { response in
                if let tokenResponse = response.value {
                    self.tokenResponse = tokenResponse
                    completion(!tokenResponse.token.isEmpty && !tokenResponse.expiresOn.isEmpty)
                    print("success")
                } else {
                    completion(false)
                    print("failure")
                }
            }
    }
}
