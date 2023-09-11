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
    @IBOutlet weak var eyeImage: UIImageView!
    
    var isPasswordVisible: Bool = false {
        didSet {
            if isPasswordVisible {
                eyeImage.image = UIImage(systemName: "eye.fill")
                passwordField.isSecureTextEntry = false
            } else {
                eyeImage.image = UIImage(systemName: "eye.slash.fill")
                passwordField.isSecureTextEntry = true
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        
        usernameField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        passwordField.addTarget(self, action: #selector(textFieldDidChange(_:)), for: .editingChanged)
        
        passwordField.isSecureTextEntry = true
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(eyeImageTapped))
        eyeImage.isUserInteractionEnabled = true
        eyeImage.addGestureRecognizer(tapGesture)
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
    
    @objc func eyeImageTapped() {
        isPasswordVisible.toggle()
    }
}
