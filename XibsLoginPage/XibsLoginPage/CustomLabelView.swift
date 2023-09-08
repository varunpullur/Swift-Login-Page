//
//  CustomLabelView.swift
//  XibsLoginPage
//
//  Created by Pullur Varun on 08/09/23.
//

import UIKit

class CustomLabelView: UIView {
    @IBOutlet weak var headingLabel: UILabel!
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        commonInit()
    }
    
    func commonInit() {
        let xibView = Bundle.main.loadNibNamed("CustomLabelView", owner: self, options: nil)![0] as! UIView
        xibView.frame = self.bounds
        addSubview(xibView)
    }
}
