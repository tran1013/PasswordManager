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
        self.navigationController?.isNavigationBarHidden = false
        self.navigationController?.navigationBar.backItem?.title = "Logout"
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func shoutAction(_ sender: UIButton) {
        guard let navigationController = navigationController else { return }
        
        let announcement = Announcement(title: "Your title", subtitle: "Your subtitle", image: UIImage(named: "avatar"))
        Whisper.show(shout: announcement, to: navigationController, completion: {
            print("The shout was silent.")
        })
    }
    
    @IBAction func whisperAction(_ sender: UIButton) {
        guard let navigationController = navigationController else { return }
        let message: Message
        
        let usrName = "test"
        let pwd = "test"
        
        if((userInput.text == usrName)&&(pwdInput.text == pwd))
        {
            self.performSegue(withIdentifier: "tabbarController", sender: sender)
            userInput.text = ""
            pwdInput.text = ""
            
        } else
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

