//
//  ViewController.swift
//  StoryboardLoginPage
//
//  Created by Pullur Varun on 05/09/23.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        usernameField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        passwordField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
    }
    
    private func setupUI() {
        btnLogin.isEnabled = false
    }
    
    @IBAction func loginBtnClicked(_ sender: UIButton) {
        guard let username = usernameField.text,
              let password = passwordField.text else {
            return
        }
        
        print("username: \(username) \npassword: \(password)")
    }
    
    @objc func textFieldDidChange(_ textField: UITextField) {
        if let username = usernameField.text,
           let password = passwordField.text,
           !username.isEmpty,
           !password.isEmpty {
            btnLogin.isEnabled = true
        } else {
            btnLogin.isEnabled = false
        }
    }
}
