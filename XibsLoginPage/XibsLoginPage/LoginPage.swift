//
//  LoginPage.swift
//  XibsLoginPage
//
//  Created by Pullur Varun on 13/09/23.
//

import UIKit

class LoginPage: UIView {

    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var btnLogin: UIButton!
    @IBOutlet weak var eyeImage: UIImageView!
    
    var btnClick: (() -> Void)?
    
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
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        let xibView = Bundle.main.loadNibNamed("CustomTextView", owner: self, options: nil)![0] as! UIView
        xibView.frame = self.bounds
        addSubview(xibView)
        
        btnLogin.addTarget(self, action: #selector(btnClicked), for: .touchUpInside)
    }
    
    func setupGestureRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(eyeImageTapped))
        eyeImage.addGestureRecognizer(tapGesture)
        eyeImage.isUserInteractionEnabled = true
    }
    
    @objc func eyeImageTapped() {
        isPasswordVisible.toggle()
    }
    
    @objc func btnClicked() {
        btnClick?()
    }
    
}
