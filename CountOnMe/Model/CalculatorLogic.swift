//
//  CalculatorLogic.swift
//  CountOnMe
//
//  Created by Marwen Haouacine on 11/05/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import Foundation

class CalculatorLogic {
    
    private var text: String = ""
    
    private var elements: [String] {
    
        return text.split(separator: " ").map { "\($0)" }
    }
    
    func performOperations(leftNumber: Double, rightNumber: Double, mathSymbol: String) -> Double {
        
        let result: Double
        
        switch mathSymbol {
        case "*":
            result = multiplyTwoNumbers(multiplying: leftNumber, with: rightNumber)
        case "/":
            result = divideTwoNumbers(dividing: leftNumber, with: rightNumber)
        case "+":
            result = addTwoNumbers(adding: leftNumber, and: rightNumber)
        case "-":
            result = substractTwoNumbers(substracting: leftNumber, and: rightNumber)
        default:
            fatalError()
        }
        return result
    }
    
    private func addTwoNumbers(adding leftNumber: Double, and rightNumbert: Double) -> Double {
        let result: Double
        result = leftNumber + rightNumbert
        return result
    }
    
    private func substractTwoNumbers(substracting leftNumber: Double, and rightNumbert: Double) -> Double {
        let result: Double
        result = leftNumber - rightNumbert
        return result
    }
    
    func multiplyTwoNumbers(multiplying leftNumber: Double, with rightNumbert: Double) -> Double {
        let result: Double
        result = leftNumber * rightNumbert
        return result
    }
    
    func divideTwoNumbers(dividing leftNumber: Double, with rightNumbert: Double) -> Double {
        let result: Double
        result = leftNumber / rightNumbert
        return result
    }
    
    func scavengeData(retrieving screenText: String) {
        text.append(screenText)
    }
    
}








