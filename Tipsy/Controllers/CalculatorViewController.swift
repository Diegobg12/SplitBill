//
//  ViewController.swift
//  Tipsy
//
//  Created by Angela Yu on 09/09/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit
import Foundation

class CalculatorViewController: UIViewController {

    @IBOutlet weak var billTextField: UITextField!
    
    @IBOutlet weak var zeroPctButton: UIButton!
    
    @IBOutlet weak var tenPctButton: UIButton!
    
    @IBOutlet weak var twentyPctButton: UIButton!
    
    @IBOutlet weak var splitNumberTotal: UILabel!
    @IBOutlet weak var billTotal: UITextField!
    
    var tip = 0.10
    var numberOfPeople: Double = 2
    var totalBill: Double = 0
    var billSplited = 0.0
    var total = ""
    
    @IBAction func tipChanged(_ sender: UIButton) {
        billTotal.endEditing(true)
        zeroPctButton.isSelected = false
        tenPctButton.isSelected = false
        twentyPctButton.isSelected = false
        
        sender.isSelected = true
        let currentTitle = sender.currentTitle!
        let number = Double(String(currentTitle.dropLast()))
        tip = number!/100
        
        
    }
    
    @IBAction func stepperValue(_ sender: UIStepper) {
        splitNumberTotal.text = String(format: "%.0f", sender.value)
        
        numberOfPeople = Double(sender.value)
    }
    
    @IBAction func calculatePressed(_ sender: UIButton) {
        let bill = billTotal.text!
        if bill != "" {
            totalBill = Double(bill)!
            billSplited = (totalBill * (1+tip)) / numberOfPeople
            total = String(format: "%.2f", billSplited)
        }
        
        self.performSegue(withIdentifier: "goToResults", sender: self)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToResults"{
            let destinationVC = segue.destination as! ResultsViewController
            destinationVC.tip = tip
            destinationVC.split = Int(numberOfPeople)
            destinationVC.result = total
            
        }
    }
    
}

