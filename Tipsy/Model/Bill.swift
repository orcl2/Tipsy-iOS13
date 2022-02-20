//
//  File.swift
//  Tipsy
//
//  Created by William Daniel da Silva Kuhs on 20/02/22.
//  Copyright © 2022 The App Brewery. All rights reserved.
//

import Foundation

struct Bill {
    var total: Float {
        get {
            return getCalculatedTotal()
        }
    }
    var totalWithoutTip: Float
    var perPerson: Float {
        get {
            return total / Float(numberOfPeople)
        }
    }
    var percentage: TipPercentage
    var numberOfPeople: Int
    
    func getCalculatedTotal() -> Float {
        let calculatedPercentage = getCalculatedPercentage()
        
        return totalWithoutTip + calculatedPercentage
    }
    
    func getCalculatedPercentage() -> Float{
        let percentage = Float(percentage.rawValue) / 100
        
        return totalWithoutTip * percentage
    }
}
