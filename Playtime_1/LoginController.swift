//
//  ViewController.swift
//  Playtime_1
//
//  Created by Anh Duc Tran on 31.03.17.
//  Copyright © 2017 Anh Duc Tran. All rights reserved.
//

import UIKit
import Log
import Whisper

class LoginController: UIViewController {
    
    @IBOutlet var userInput: UITextField!
    @IBOutlet var pwdInput: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboard()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    
    @IBAction func loginAction(_ sender: UIButton) {
        guard let navigationController = navigationController else { return }
        let message: Message
        
        let usrName = "test"
        let pwd = "test"
        
        if((userInput.text == usrName)&&(pwdInput.text == pwd))
        {
            self.performSegue(withIdentifier: "tabbarController", sender: sender)
            userInput.text = ""
            pwdInput.text = ""
            self.navigationController?.isNavigationBarHidden = true
            
        }
        else if((userInput.text?.isEmpty == true)||(pwdInput.text?.isEmpty == true)){
            message = Message(title: "User or Password empty", backgroundColor: .red)
            Whisper.show(whisper: message, to: navigationController, action: .show)
        }
        else
        {
            message = Message(title: "User & Password incorrect", backgroundColor: .red)
            Whisper.show(whisper: message, to: navigationController, action: .show)
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
}

