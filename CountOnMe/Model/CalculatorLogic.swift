//
//  CalculatorLogic.swift
//  CountOnMe
//
//  Created by Marwen Haouacine on 11/05/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import Foundation

class CalculatorLogic {
    var stringNumbers = [String]()
    var operands = [String]()
    var alert: ((String) -> ())?
    
    
    var expressionIsCorrect: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                if stringNumbers.count == 1 {
                    alert?("Start a new operation")
                } else {
                    alert?("Incorrect Synthax")
                }
                return false
            }
        }
        return true
    }
    
    var canAddOperator: Bool {
        if let stringNumber = stringNumbers.last {
            if stringNumber.isEmpty {
                alert?("Starting with a number will be better")
                return false
            }
        }
        return true
    }
    
    func addNumber(_ newNumber: Int) -> String {
        if let stringNumber = stringNumbers.last {
            var mutableStringNumber = stringNumber
            mutableStringNumber += "\(newNumber)"
            stringNumbers.insert(mutableStringNumber, at: stringNumbers.count-1)
        }
        return String(newNumber)
    }
    
    func calculateTotal() -> String {
        if !expressionIsCorrect {
            return "0"
        }
        var total = 0.0
        stringNumbers.forEach { stringNumber in
            if let number = Double(stringNumber) {
                if operands.last == "+" {
                    total += number
                } else if operands.last == "-" {
                    total -= number
                }
            }
        }
        let finalResult = String(format: "%.2f", total)
        return finalResult
    }
}
