//
//  CalculatorLogic.swift
//  CountOnMe
//
//  Created by Marwen Haouacine on 11/05/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import Foundation

class CalculatorLogic {
    var numbers = [Double]()
    var mathSymbols = [String]()
    var priorityResult: Double = 0
    
    func performOperations() -> String {
        
        while numbers.count > 1 {
            
            let leftNumber = numbers[0]
            let rightNumber = numbers[1]
            let symbol = mathSymbols[0]
            let result: Double
            
            switch symbol {
            case "+":
                result = leftNumber + rightNumber
            case "-":
                result = leftNumber - rightNumber
            case "*":
                result = priorityCalculation()
            case "/":
                result = priorityCalculation()
            default:
                fatalError()
            }
            numbers = Array(numbers.dropFirst(2))
            numbers.insert(result, at: 0)
            mathSymbols.removeFirst()
        }
        return String(numbers[0])
    }
    
    func clear() {
        numbers = [Double]()
        mathSymbols = [String]()
    }
    
   private func priorityCalculation() -> Double {

        while mathSymbols.contains("*") || mathSymbols.contains("/") {
            if let symbolIndex = mathSymbols.firstIndex (where: { $0 == "*" || $0 == "/" }) {
               
                let symbol = mathSymbols[symbolIndex]
                let leftOperand = numbers[symbolIndex - 1]
                let rightOperand = numbers[symbolIndex]
                
                if symbol == "*" {
                    priorityResult = leftOperand * rightOperand
                } else {
                    priorityResult = leftOperand / rightOperand
                }
                mathSymbols.remove(at: symbolIndex)
                numbers.insert(priorityResult, at: symbolIndex - 1)
                numbers.remove(at: symbolIndex)
            }
        }
        return priorityResult
    }
}


/*  var elements: [String] {
 return textView.text.split(separator: " ").map { "\($0)" }
 }
 
 // Error check computed variables
 var expressionIsCorrect: Bool {
 return elements.last != "+" && elements.last != "-"
 }
 
 var expressionHaveEnoughElement: Bool {
 return elements.count >= 3
 }
 
 var canAddOperator: Bool {
 return elements.last != "+" && elements.last != "-"
 }
 
 var expressionHaveResult: Bool {
 return textView.text.firstIndex(of: "=") != nil
 }
 
 // Create local copy of operations
 var operationsToReduce = elements
 
 // Iterate over operations while an operand still here
 while operationsToReduce.count > 1 {
 let left = Int(operationsToReduce[0])!
 let operand = operationsToReduce[1]
 let right = Int(operationsToReduce[2])!
 
 let result: Int
 switch operand {
 case "+": result = left + right
 case "-": result = left - right
 default: fatalError("Unknown operator !")
 }
 
 operationsToReduce = Array(operationsToReduce.dropFirst(3))
 operationsToReduce.insert("\(result)", at: 0)
 }
 
 textView.text.append(" = \(operationsToReduce.first!)")
 }
 
 */





