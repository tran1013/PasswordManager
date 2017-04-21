//
//  PasswordGenerator.swift
//  Playtime_1
//
//  Created by Anh Duc Tran on 31.03.17.
//  Copyright © 2017 Anh Duc Tran. All rights reserved.
//

import Foundation
import UIKit
import Log
import Whisper

class PasswordGeneratorController : UIViewController
{
    
    @IBOutlet var lengthSlider: UILabel!
    @IBOutlet var textView: UITextView!
    
    @IBOutlet var lengthText: UILabel!
    @IBOutlet var digitsLabel: UILabel!
    @IBOutlet var symbolsLabel: UILabel!
    @IBOutlet var upperCaseLabel: UILabel!
    
    @IBOutlet var saveButton: UIButton!
    
    var sliderValue: Int = 10
    var result: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.layer.borderWidth = 0.5
        textView.layer.borderColor = UIColor.darkGray.cgColor
        textView.layer.cornerRadius = 5
        saveButton.isHidden = true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        let step: Float = 1
        let roundedValue = round(sender.value / step) * step
        sender.value = roundedValue
        sliderValue = Int(sender.value)
        lengthSlider.text = String(Int(roundedValue))
    }
    
    @IBAction func generatePwd(_ sender: UIButton) {
        generatePassword()
        textView.text = result
        saveButton.isHidden = false
        
    }
    
    @IBAction func digitsStepper(_ sender: UIStepper) {
        digitsLabel.text = String(Int(sender.value))
    }
    
    @IBAction func symbolsStepper(_ sender: UIStepper) {
        symbolsLabel.text = String(Int(sender.value))
    }
    
    @IBAction func upperCaseStepper(_ sender: UIStepper) {
        upperCaseLabel.text = String(Int(sender.value))
    }
    
    @IBAction func saveAction(_ sender: UIButton) {
        
        
        let pwSaveView = storyboard?.instantiateViewController(withIdentifier: "pwSaveView") as! PasswordSaveController
        
        pwSaveView.pwTextView = result
        navigationController?.pushViewController(pwSaveView, animated: true)
        
        
    }
    
    /**
     Generate the password with the settings from the user
     - parameter term:
     - returns: void
     */
    func generatePassword(){
        let log = Logger()
        var password: String = ""
        
        let lettersUp: NSString = "ABCDEFGHIJKLMNOPQRSTUVWXIZ"
        let letter: NSString = "abcdefghijklmnopqrstuvwxyz"
        let digits: NSString = "123456789"
        let symbols: NSString = "!§$%&/()=?[]|{}"
        let message: Message
        guard let navigationController = navigationController else { return }
        
        let digitsInPw = Int(digitsLabel.text!)
        let symbolsInPW = Int(symbolsLabel.text!)
        let upperLettersInPW = Int(upperCaseLabel.text!)
        let letterInPw = sliderValue - digitsInPw! - symbolsInPW! - upperLettersInPW!
        let usrInputNumbersOfChars = digitsInPw! + symbolsInPW! + upperLettersInPW!
        
        if(usrInputNumbersOfChars <= sliderValue){
            password += passwordLoop(range: digitsInPw!, charType: digits)
            password += passwordLoop(range: symbolsInPW!, charType: symbols)
            password += passwordLoop(range: upperLettersInPW!, charType: lettersUp)
            password += passwordLoop(range: letterInPw, charType: letter)
            result = finalizePassword(range: sliderValue, pwOrdered: password as NSString)
            log.info("Password generated 🎉😁")
            message = Message(title: "Password generated 🎉", backgroundColor: .green)
            Whisper.show(whisper: message, to: navigationController, action: .show)
            
            print("PASSWORD: \(result)")
        } else if(usrInputNumbersOfChars > sliderValue) {
            log.error("Something shit happened 💩😱")
            let alert = UIAlertController(title: "Can't do it...", message: "Your settings are longer than the whole password length 😱", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "I'm sorry. I'll fix it. 😩", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
    }
    
    /**
     Generate piece of the whole password
     - note: the variable password will be filled with specific chars which the user wants in order.
     - parameter range: Set the range to get the number of specific chars
     - parameter charType: The type of strings to select from
     - returns: String with the chartype
     */
    func passwordLoop(range: Int, charType: NSString) -> String
    {
        var password: String = ""
        
        for _ in 0 ..< range{
            let random = arc4random_uniform(UInt32(charType.length))
            var char = charType.character(at: Int(random))
            password += NSString(characters: &char, length: 1) as String
        }
        return password
    }
    
    /**
     Generate the final password for the user
     - parameter range: Set the range to get the number of specific chars
     - parameter pwOrdered: The password with specific cahrs ordered
     - returns: String with the final password
     */
    func finalizePassword(range: Int, pwOrdered: NSString) -> String {
        var password: String = ""
        var checkNumbrs: [UInt32] = []
        while((checkNumbrs.count + 1) <= sliderValue){
            let random = arc4random_uniform(UInt32(pwOrdered.length))
            if(!(checkNumbrs.contains(random))){
                checkNumbrs.append(random)
                var char = pwOrdered.character(at: Int(random))
                password += NSString(characters: &char, length: 1) as String
            }
        }
        return password
    }
    
}
