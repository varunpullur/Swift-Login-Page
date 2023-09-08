//
//  CustomButtonView2.swift
//  XibsLoginPage
//
//  Created by Pullur Varun on 08/09/23.
//

import UIKit

class CustomButtonView2: UIView {
    
    @IBOutlet weak var button: UIButton!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        let xibView = Bundle.main.loadNibNamed("CustomButtonView2", owner: self, options: nil)![0] as! UIView
        xibView.frame = self.bounds
        addSubview(xibView)
        
    }
    
}
