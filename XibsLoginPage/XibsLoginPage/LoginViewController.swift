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
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        passwordTextView.inputField.isSecureTextEntry = true
        
        customLabelView.headingLabel.text = "Sign In"
        usernameTextView.inputField.placeholder = "Username"
        passwordTextView.inputField.placeholder = "Password"
    
    }
}

