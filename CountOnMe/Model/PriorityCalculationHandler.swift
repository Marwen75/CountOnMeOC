//
//  PriorityCalculationHandler.swift
//  CountOnMe
//
//  Created by Marwen Haouacine on 26/05/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import Foundation

class PriorityCalculationHandler {
    
    var mathSymbols: [String]
    var numbers: [Double]
    
    init(mathSymbols: [String], numbers: [Double]) {
        self.mathSymbols = mathSymbols
        self.numbers = numbers
    }
    
   // private enum DivisionByZeroError: Error {
   //     case divisionByZeroIsImpossible(String)
   // }
    
   // private func divisionByZeroCheck(rightNumber: Double) throws {
        
   //     guard rightNumber != 0 else {
            
    //        throw DivisionByZeroError.divisionByZeroIsImpossible("On ne peut pas diviser par 0")
    //    }
   // }
    
    private func multiply(multiplying leftNumber: Double, with rightNumbert: Double) -> Double {
        let result: Double
        result = leftNumber * rightNumbert
        return result
    }
    
    private func divide(dividing leftNumber: Double, with rightNumbert: Double) -> Double {
        let result: Double
        result = leftNumber / rightNumbert
        return result
    }
    
    func handlePriorityOperators() {
        
        while mathSymbols.contains("*") || mathSymbols.contains("/") {
            if let priorityIndex = mathSymbols.firstIndex (where: { $0 == "*" || $0 == "/" }) {
                let priorityResult: Double
                let prioritySymbol = mathSymbols[priorityIndex]
                let leftNumber = numbers[priorityIndex]
                let rightNumber = numbers[priorityIndex + 1]
                
                if prioritySymbol == "*" {
                    priorityResult = multiply(multiplying: leftNumber, with: rightNumber)
                    mathSymbols.remove(at: priorityIndex)
                    numbers.remove(at: priorityIndex)
                    numbers.remove(at: priorityIndex)
                    numbers.insert(priorityResult, at: priorityIndex)
                } else if prioritySymbol == "/" {
                    //divisionByZeroCheck(rightNumber: rightNumber)
                    priorityResult = divide(dividing: leftNumber, with: rightNumber)
                    mathSymbols.remove(at: priorityIndex)
                    numbers.remove(at: priorityIndex)
                    numbers.remove(at: priorityIndex)
                    numbers.insert(priorityResult, at: priorityIndex)
                }
            }
        }
    }
}
