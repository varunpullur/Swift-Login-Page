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
    
    func validateUser(base64string: String, completion: @escaping (Bool) -> Void){
        let base64encoded = base64string
        let headers: HTTPHeaders = [
            "Authorization": "Basic \(base64encoded)",
            "X-Nspire-AppToken": "f07740dc-1252-48f3-9165-c5263bbf373c"
        ]
        
        AF.request("https://identity-stage.spireon.com/identity/token",headers: headers )
            .responseDecodable(of: Response.self) { response in
                if let data = response.data,
                   let decodedResponse = try? JSONDecoder().decode(Response.self, from: data) {
                    completion(decodedResponse.expiresOn != nil && decodedResponse.token != nil)
                    print("Success")
                } else {
                    completion(false)
                    print("Failure")
                }
            }
    }
}
