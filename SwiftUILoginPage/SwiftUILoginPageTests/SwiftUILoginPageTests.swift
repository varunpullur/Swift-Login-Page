//
//  SwiftUILoginPageTests.swift
//  SwiftUILoginPageTests
//
//  Created by Pullur Varun on 19/09/23.
//

import XCTest
import Alamofire
@testable import SwiftUILoginPage

class LoginPageViewModelTests: XCTestCase {
    
    func testValidateUserWithValidResponse() {

        let viewModel = LoginPageViewModel()
        let credentials = "atistagetest:Password1"
        let base64credentials = credentials.data(using: .utf8)?.base64EncodedString()
        
        let expectation = XCTestExpectation(description: "Login Successful Expectation")
        
        viewModel.validateUser(base64string: base64credentials ?? "") { isValid in

            XCTAssertTrue(isValid)
            XCTAssertNotNil(viewModel.$tokenResponse)
            XCTAssertNotNil(viewModel.tokenResponse?.getExpiresOn())
            XCTAssertNotNil(viewModel.tokenResponse?.getToken())
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
    
    func testValidateUserWithInvalidResponse() {

        let viewModel = LoginPageViewModel()
        let credentials = "atistageprod:Password2"
        let base64credentials = credentials.data(using: .utf8)?.base64EncodedString()
        
        let expectation = XCTestExpectation(description: "Login Successful Expectation")
        
        viewModel.validateUser(base64string: base64credentials ?? "") { isValid in

            XCTAssertFalse(isValid)
            XCTAssertNil(viewModel.tokenResponse)
            expectation.fulfill()
        }
        
        wait(for: [expectation], timeout: 5)
    }
}

