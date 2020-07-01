//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var billTextField: UITextField!
    @IBOutlet weak var zeroPctButton: UIButton!
    @IBOutlet weak var tenPctButton: UIButton!
    @IBOutlet weak var twentyPctButton: UIButton!
    @IBOutlet weak var splitNumerLabel: UILabel!
    
    var tipPercentage = 0.0
    var numberOfPeople = 2
    var amountPerPerson = 0.0
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTextField.endEditing(true)
        if sender.titleLabel?.text == "0%" {
            zeroPctButton.isSelected = true
            tenPctButton.isSelected = false
            twentyPctButton.isSelected = false
        } else if sender.titleLabel?.text == "10%" {
            tipPercentage = 0.1
            tenPctButton.isSelected = true
            zeroPctButton.isSelected = false
            twentyPctButton.isSelected = false
        } else {
            tipPercentage = 0.2
            twentyPctButton.isSelected = true
            tenPctButton.isSelected = false
            zeroPctButton.isSelected = false
        }
        
    }
    
    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        numberOfPeople = Int(sender.value)
        splitNumerLabel.text = "\(numberOfPeople)"
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let totalAmount = Double(billTextField.text ?? "0") ?? 0
        let billTotal = totalAmount + (totalAmount * tipPercentage)
        amountPerPerson = billTotal / Double(numberOfPeople)
        performSegue(withIdentifier: "goToResult", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResult" {
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.numberOfPeople = numberOfPeople
            destinationVC.moneyPerPerson = amountPerPerson
            destinationVC.tipPercentage = tipPercentage * 100
            
        }
    }
    
}

