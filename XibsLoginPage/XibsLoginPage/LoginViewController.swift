//
//  ViewController.swift
//  XibsLoginPage
//
//  Created by Pullur Varun on 05/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var customLabelView: CustomLabelView!
    @IBOutlet weak var usernameTextView: CustomTextView!
    @IBOutlet weak var passwordTextView: CustomTextView!
    @IBOutlet weak var loginButtonView: CustomButtonView!
    @IBOutlet weak var forgotButtonView: CustomButtonView2!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        passwordTextView.inputField.isSecureTextEntry = true
        loginButtonView.button.isEnabled = false
        
        usernameTextView.inputField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        passwordTextView.inputField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        loginButtonView.buttonClick = {
            self.loginButtonClicked()
        }
        
        customLabelView.headingLabel.text = "Sign In"
        usernameTextView.inputField.placeholder = "Username"
        passwordTextView.inputField.placeholder = "Password"
        loginButtonView.button.setTitle("Login", for: .normal)
        forgotButtonView.button.setTitle("Forgot Password?", for: .normal)
    }
    
    func loginButtonClicked() {
        let username = usernameTextView.inputField.text!
        let password = passwordTextView.inputField.text!
        print("username: \(username) \npassword: \(password)")
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if let username = usernameTextView.inputField.text,
           let password = passwordTextView.inputField.text,
           !username.isEmpty,
           !password.isEmpty {
            loginButtonView.button.isEnabled = true
        } else {
            loginButtonView.button.isEnabled = false
        }
    }
}

