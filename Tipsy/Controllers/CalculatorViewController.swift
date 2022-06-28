//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet var billTextField: UITextField!
    
    @IBOutlet var zeroPctButton: UIButton!
    @IBOutlet var tenPctButton: UIButton!
    @IBOutlet var twentyPctButton: UIButton!
   
    @IBOutlet var splitNumber: UILabel!
    
    var tipsValue: Float = 0.1
    var numberOfPeople: Int = 2
    var perPersonFinal: String = "0.0"

    @IBAction func tipChanged(_ sender: UIButton) {
        
        billTextField.endEditing(true)
        
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        sender.isSelected = true
        
        let buttonTitle = sender.currentTitle!
        let buttonTitleNoLastSymbol = String(buttonTitle.dropLast())
        let buttonTitleAsANumber = Float(buttonTitleNoLastSymbol)!
        tipsValue = buttonTitleAsANumber / 100
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        numberOfPeople = Int(sender.value)
        splitNumber.text = String(format: "%.0f", sender.value)
       // OR splitNumber.text = String(numberOfPeople)
        billTextField.endEditing(true)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {

        if segue.identifier == "toResult" {
            let destinationVC = segue.destination as! RelultsViewController
            destinationVC.perPerson = perPersonFinal
            destinationVC.numberOfPeople = numberOfPeople
            destinationVC.tipsPrc = Int(tipsValue * 100)
        }
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        
        let total = Float(billTextField.text!)!
        let perPerson = (total + total * tipsValue) / Float(numberOfPeople)
        perPersonFinal = String(format: "%.2f", perPerson)
       
        performSegue(withIdentifier: "toResult", sender: self)
    }
}

