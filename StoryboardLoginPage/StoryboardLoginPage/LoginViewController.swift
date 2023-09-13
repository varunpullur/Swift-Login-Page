//
//  ViewController.swift
//  StoryboardLoginPage
//
//  Created by Pullur Varun on 05/09/23.
//

import UIKit

extension UITextField {
    func addUnderline() {
        let underline = CALayer()
        underline.frame = CGRect(x: 0, y: self.frame.height - 1, width: self.frame.width, height: 1)
        underline.backgroundColor = UIColor.white.cgColor
        self.borderStyle = .none
        self.layer.addSublayer(underline)
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var eyeImage: UIImageView!
    
    
    var isPasswordVisible: Bool = false {
        didSet {
            if isPasswordVisible {
                eyeImage.image = UIImage(systemName: "eye.slash.fill")
                passwordField.isSecureTextEntry = false
            } else {
                eyeImage.image = UIImage(systemName: "eye.fill")
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
        
        usernameField.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        passwordField.attributedPlaceholder = NSAttributedString(string: "Password", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        usernameField.addUnderline()
        passwordField.addUnderline()
    }
    
    private func setupUI() {
        btnLogin.isEnabled = false
        btnLogin.backgroundColor = UIColor.white
        btnLogin.layer.cornerRadius = 5
        btnLogin.layer.opacity = 0.7
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
            btnLogin.layer.opacity = 0.9
        } else {
            btnLogin.isEnabled = false
        }
    }
    
    @objc func eyeImageTapped() {
        isPasswordVisible.toggle()
    }
    
}
