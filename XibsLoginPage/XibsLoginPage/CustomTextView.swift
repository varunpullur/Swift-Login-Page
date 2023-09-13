//
//  CustomTextView.swift
//  XibsLoginPage
//
//  Created by Pullur Varun on 08/09/23.
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

class CustomTextView: UIView {

    @IBOutlet weak var inputField: UITextField!
    @IBOutlet weak var eyeImage: UIImageView!
    
    var isTextVisible: Bool = false {
        didSet {
            if isTextVisible {
                eyeImage.image = UIImage(systemName: "eye.fill")
                inputField.isSecureTextEntry = false
            } else {
                eyeImage.image = UIImage(systemName: "eye.slash.fill")
                inputField.isSecureTextEntry = true
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
        
        inputField.attributedPlaceholder = NSAttributedString(string: "Username", attributes: [NSAttributedString.Key.foregroundColor: UIColor.white])
        
        inputField.addUnderline()
    }
    
    func setupGestureRecognizer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(eyeImageTapped))
        eyeImage.addGestureRecognizer(tapGesture)
        eyeImage.isUserInteractionEnabled = true
        }
    
    @objc func eyeImageTapped() {
            isTextVisible.toggle()
        }
    
}
