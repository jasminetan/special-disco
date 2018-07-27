//
//  Converter.swift
//  conversion-calc-ui
//
//  Created by Jasmine Tan on 7/25/18.
//  Copyright © 2018 Jasmine Tan. All rights reserved.
//

import Foundation

class Converter{
    enum ConType: String {
        case cToF = "celsius to fahrenheit"
        case fToC = "fahrenheit to celsius"
        case kmToMi = "kilometers to miles"
        case miToKm = "miles to kilometers"
    }
    
    let array = [ConItems(label: ConType.fToC.rawValue, inputName: "°F", outputName: "°C"),
                 ConItems(label: ConType.cToF.rawValue, inputName: "°C", outputName: "°F"),
                 ConItems(label: ConType.miToKm.rawValue, inputName: "mi", outputName: "km"),
                 ConItems(label: ConType.kmToMi.rawValue, inputName: "km", outputName: "mi")]
    
    func convert(input: String, conversion: String) -> Double {
        let input = Double(input)
        var output:Double = 0
        
        if(conversion == "°F"){
            output = (input! - 32) * 5/9
            return output
        }
        if(conversion == "°C"){
            output = (input! * 9/5) + 32
            return output
        }
        if(conversion == "mi"){
            output = (input! / 0.62137)
            return output
        }
        if(conversion == "km"){
            output = (input! * 0.62137)
            return output
        }
        return output
    }
    
    func outputUnit(unit: String) -> String {
        if(unit == "°F"){
            return "°C"
        }
        if(unit == "°C"){
            return "°F"
        }
        if(unit == "mi"){
            return "km"
        }
        if(unit == "km"){
            return "mi"
        }
        return "error"
    }
}
    

