//
//  PasswordSave.swift
//  PasswordManager
//
//  Created by Anh Duc Tran on 01.04.17.
//  Copyright © 2017 Anh Duc Tran. All rights reserved.
//

import Foundation
import UIKit

class PasswordSaveController: UIViewController{
    
    @IBOutlet var siteFor: UITextField!
    @IBOutlet var username: UITextField!
    @IBOutlet var textView: UITextView!
    
    
    
    @IBAction func saveBtn(_ sender: UIButton) {
        let objectPW = PasswordObject(pwFor: siteFor.text!, username: username.text!, password: textView.text! )
        
        print("OBJECT: \(objectPW.pwFor) | \(objectPW.username) | \(objectPW.password)")
    }
}
