//
//  PasswordSave.swift
//  PasswordManager
//
//  Created by Anh Duc Tran on 01.04.17.
//  Copyright © 2017 Anh Duc Tran. All rights reserved.
//

import Foundation
import UIKit
import Whisper

class PasswordSaveController: UIViewController{
    
    @IBOutlet var siteFor: UITextField!
    @IBOutlet var username: UITextField!
    @IBOutlet var textView: UITextView!
    
    var pwTextView:String = ""
    var db = database()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = pwTextView
        textView.layer.borderWidth = 0.5
        textView.layer.borderColor = UIColor.darkGray.cgColor
        textView.layer.cornerRadius = 5
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func saveBtn(_ sender: UIButton) {
        let message: Message
        guard let navigationController_ = navigationController else { return }

        if(siteFor.text!.isEmpty || username.text!.isEmpty)
        {
            let alert = UIAlertController(title: "Can't save it...", message: "Either the username or site textfield is empty 🙄", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "I'm sorry. I'll fix it. 😩", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        } else {
            db.insert(site_: siteFor.text!, username_: username.text!, password_: textView.text!)
            message = Message(title: "Password saved 🎉", backgroundColor: .green)
            Whisper.show(whisper: message, to: navigationController_, action: .show)

        }
        
    }
}
