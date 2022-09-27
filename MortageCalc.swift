//
//  MortageCalc.swift
//  Mortgage
//
//  Created by Reynolds, Madison Elizabeth on 9/27/22.
//

import Foundation

class MortageCalc
{
    var nyears:Int
    var currentValue: Double
    var tax:Double
    var intRate: Double
    
    init(nyears: Int, currentValue: Double, tax: Double, intRate: Double){
        self.nyears = nyears
        self.currentValue = currentValue
        self.tax = tax
        self.intRate = intRate
    }
    
    func calCulatePayment() -> Double{
        intRate /= 1200
        let theTax = (tax / 1200) * currentValue
        let pmt = currentValue * (intRate + intRate/pow(1.0 + intRate, Double(nyears) * 12)) + theTax
        
        return pmt
    }
}
