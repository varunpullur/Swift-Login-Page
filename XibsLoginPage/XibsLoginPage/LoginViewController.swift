//
//  ViewController.swift
//  XibsLoginPage
//
//  Created by Pullur Varun on 05/09/23.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var customLabelView: CustomLabelView!

    override func viewDidLoad() {
        super.viewDidLoad()

        customLabelView.headingLabel.text = "Sign In"
    }
}

