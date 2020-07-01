//
//  ResultsViewController.swift
//  Tipsy
//
//  Created by Yusuf ÇAĞLAR on 31/10/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet weak var totalLabel: UILabel!
    @IBOutlet weak var settingsLabel: UILabel!
    
    var moneyPerPerson = 0.0
    var numberOfPeople = 0
    var tipPercentage =  0.1
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        totalLabel.text = String(format: "%.2f", moneyPerPerson)
        settingsLabel.text = "Split between \(numberOfPeople) people with % \(tipPercentage) tip"
        
    }
    
    @IBAction func recalculatePressed(_ sender: UIButton) {
        dismiss(animated: true, completion: nil)
    }
    
}
