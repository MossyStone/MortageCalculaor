//
//  ViewController.swift
//  Mortgage
//
//  Created by Reynolds, Madison Elizabeth on 9/27/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var currentPrice: UITextField!
    @IBOutlet weak var taxRate: UITextField!
    @IBOutlet weak var changeInterest: UISlider!
    @IBOutlet weak var interest: UILabel!
    @IBOutlet weak var years: UILabel!
    @IBOutlet weak var changeYears: UIStepper!
    @IBOutlet weak var payement: UILabel!
    
    var mortgageCalc: MortageCalc!
    
    @IBAction func calMortage(_ sender: UIButton) {
        if let currentVal = Double(currentPrice.text!){
            if let tax = Double(taxRate.text!){
                let intRate = Double(changeInterest.value)
                let nyears = Int(changeYears.value)
                mortgageCalc = MortageCalc(nyears: nyears, currentValue: currentVal, tax: tax, intRate: intRate)
                let pmt = mortgageCalc.calCulatePayment()
                payement.text = String(format: "The Payment is: %.2f", pmt)
                
            }
        }
    }
    
    @IBAction func modifyInterest(_ sender: UISlider) {
        let intRate = changeInterest.value
        interest.text = String(format: "%.3f", intRate) + "%"
    }
    
    @IBAction func modifyYears(_ sender: UIStepper) {
        years.text = "\(Int(changeYears.value))"
    }
    
    override func viewDidLoad() {
        changeYears.value = 15
        changeInterest.value = 3.0
        
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

