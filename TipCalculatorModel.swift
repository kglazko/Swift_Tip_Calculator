//
//  TipCalculatorModel.swift
//  TipCalculator
//
//  Created by yglazko on 7/8/14.
//  Copyright (c) 2014 yglazko. All rights reserved.
//

import Foundation
import UIKit

class TipCalculatorModel {
    var total: Double
    var taxPct : Double
    var subtotal: Double {
    get {
        return total / (taxPct + 1)
    }
    }
    
    init(total:Double, taxPct:Double) {
        self.total = total
        self.taxPct = taxPct
    }
    
    func calcTipWithTipPct(tipPct:Double) -> Double {
        return subtotal * tipPct
    }
    
    func returnPossibleTips() -> [Int: Double] {
        
        let possibleTipsInferred = [0.15, 0.18, 0.20]
        let possibleTipsExplicit:[Double] = [0.15, 0.18, 0.20]
        
        // 2
        var retval = Dictionary<Int, Double>()
        for possibleTip in possibleTipsInferred {
            let intPct = Int(possibleTip*100)
            // 3
            retval[intPct] = calcTipWithTipPct(possibleTip)
        }
        return retval
        
    }
}

