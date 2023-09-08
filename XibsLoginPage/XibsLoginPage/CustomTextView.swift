//
//  CustomTextView.swift
//  XibsLoginPage
//
//  Created by Pullur Varun on 08/09/23.
//

import UIKit

class CustomTextView: UIView {

    @IBOutlet weak var inputField: UITextField!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        let xibView = Bundle.main.loadNibNamed("CustomTextView", owner: self, options: nil)![0] as! UIView
        xibView.frame = self.bounds
        addSubview(xibView)
    }
    
}
