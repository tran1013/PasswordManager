//
//  PasswordDetailController.swift
//  PasswordManager
//
//  Created by Anh Duc Tran on 01.04.17.
//  Copyright © 2017 Anh Duc Tran. All rights reserved.
//

import Foundation
import UIKit

class PasswordDetailController: UIViewController{

    @IBOutlet var siteLabel: UILabel!
    @IBOutlet var usernameLabel: UILabel!
    @IBOutlet var textViewLabel: UITextView!
    @IBOutlet var textView: UITextView!
    
    var site = ""
    var username = ""
    var password = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.layer.borderWidth = 0.5
        textView.layer.borderColor = UIColor.darkGray.cgColor
        textView.layer.cornerRadius = 5
        siteLabel.text = site
        usernameLabel.text = username
        textView.text = password
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
        
}
