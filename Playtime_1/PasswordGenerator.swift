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

class PasswordGeneratorController : UIViewController
{
    
    @IBOutlet var lengthSlider: UILabel!
    @IBOutlet var textView: UITextView!
    
    @IBOutlet var lengthText: UILabel!
    @IBOutlet var digitsLabel: UILabel!
    @IBOutlet var symbolsLabel: UILabel!
    @IBOutlet var upperCaseLabel: UILabel!
    
    var sliderValue: Int = 10
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        let generatedPw = generatePassword()
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
        let password = textView.text!
        
        
    }
    
    func generatePassword(){
        let log = Logger()
        var password: String = ""
        
        let lettersUp: NSString = "ABCDEFGHIJKLMNOPQRSTUVWXIZ"
        let letter: NSString = "abcdefghijklmnopqrstuvwxyz"
        let digits: NSString = "123456789"
        let symbols: NSString = "!§$%&/()=?[]|{}"
        
        let digitsInPw = Int(digitsLabel.text!)
        let symbolsInPW = Int(symbolsLabel.text!)
        let upperLettersInPW = Int(upperCaseLabel.text!)
        let letterInPw = sliderValue - digitsInPw! - symbolsInPW! - upperLettersInPW!
        let usrInputNumbersOfChars = digitsInPw! + symbolsInPW! + upperLettersInPW!
        print("digitsInPw: \(digitsInPw!)")
        print("symbolsInPW: \(symbolsInPW!)")
        print("upperLettersInPW: \(upperLettersInPW!)")
        print("letterInPw: \(letterInPw)")
        print("usrInputNumbersOfChars: \(usrInputNumbersOfChars)")
        
        if(usrInputNumbersOfChars <= sliderValue){
            password += passwordLoop(range: digitsInPw!, charType: digits)
            password += passwordLoop(range: symbolsInPW!, charType: symbols)
            password += passwordLoop(range: upperLettersInPW!, charType: lettersUp)
            password += passwordLoop(range: letterInPw, charType: letter)
            log.info("Password generated 🎉😁")
            print("PASSWORD: \(password)")
        } else if(usrInputNumbersOfChars > sliderValue) {
            log.error("Something shit happened 💩😱")
            let alert = UIAlertController(title: "Can't do it...", message: "Your settings are longer than the whole password length 😱", preferredStyle: UIAlertControllerStyle.alert)
            alert.addAction(UIAlertAction(title: "I'm sorry. I'll fix it. 😩", style: UIAlertActionStyle.default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        let finalPw: NSString = password as NSString
        print("finalPw: \(finalPw)")
        let x = passwordLoop(range: sliderValue, charType: finalPw)
        print("loop: \(x)")
    }
    
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
    
}
