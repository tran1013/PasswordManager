//
//  PasswordGenerator.swift
//  Playtime_1
//
//  Created by Anh Duc Tran on 31.03.17.
//  Copyright © 2017 Anh Duc Tran. All rights reserved.
//

import Foundation
import UIKit

class PasswordGeneratorController : UIViewController
{
    
    @IBOutlet var lengthSlider: UILabel!
    @IBOutlet var textView: UITextView!
    
    @IBOutlet var lengthText: UILabel!
    @IBOutlet var digitsLabel: UILabel!
    @IBOutlet var symbolsLabel: UILabel!
    @IBOutlet var upperCaseLabel: UILabel!
    
    
    
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
        lengthSlider.text = String(Int(roundedValue))
    }
    
    @IBAction func generatePwd(_ sender: UIButton) {
        
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
    
    
    func checkTextInput()
    {
        
    }
}
