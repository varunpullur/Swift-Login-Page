//
//  CustomButtonView.swift
//  XibsLoginPage
//
//  Created by Pullur Varun on 08/09/23.
//

import UIKit

class CustomButtonView: UIView {
    
    @IBOutlet weak var button: UIButton!
    var buttonClick: (() -> Void)?
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        let xibView = Bundle.main.loadNibNamed("CustomButtonView", owner: self, options: nil)![0] as! UIView
        xibView.frame = self.bounds
        addSubview(xibView)
        
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
    }
    
    @objc func buttonClicked() {
        buttonClick?()
    }
}
