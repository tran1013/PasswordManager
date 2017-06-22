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
import Log

class PasswordSaveController: UIViewController{
    
    @IBOutlet var siteFor: UITextField!
    @IBOutlet var username: UITextField!
    @IBOutlet var textView: UITextView!
    
    var PWListController: PasswordListController = PasswordListController(nibName: nil, bundle: nil)
    var pws: [Password] = []
    var pwTextView:String = ""
    
    let log = Logger()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboard()
        textView.text = pwTextView
        textView.layer.borderWidth = 0.5
        textView.layer.borderColor = UIColor.darkGray.cgColor
        textView.layer.cornerRadius = 5
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func saveBtn(_ sender: UIButton) {
        if(siteFor.text!.isEmpty || username.text!.isEmpty)
        {
            let alert = UIAlertController(title: "Can't save it...", message: "Either the username or site textfield is empty 🙄", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "I'm sorry. I'll fix it. 😩", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
            log.error("Something bad happened...")
        } else {
            
            let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
            let password = Password(context: context)
            password.passwordFor = siteFor.text!
            password.username = username.text!
            password.password = textView.text!
            
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            performSegueToReturnBack()
            self.tabBarController?.selectedIndex = 0
            log.info("Item saved!")
        }
    }
    
    func hideKeyboard()
    {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
    
    func performSegueToReturnBack()  {
        if let nav = self.navigationController {
            nav.popViewController(animated: true)
        } else {
            self.dismiss(animated: true, completion: nil)
        }
    }
}
