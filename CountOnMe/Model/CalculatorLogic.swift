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
    
    private var expressionToParse: [String] {
        return text.split(separator: " ").map { "\($0)" }
    }
    
    private var expressionContainsPriorityOperators: Bool {
        return expressionToParse.contains("*") || expressionToParse.contains("/")
    }
    
    private func performNonPriorityOperations(leftNumber: Double, rightNumber: Double, mathSymbol: String) -> Double {
        
        let result: Double
        
        switch mathSymbol {
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
    
    private func multiplyTwoNumbers(multiplying leftNumber: Double, with rightNumbert: Double) -> Double {
        let result: Double
        result = leftNumber * rightNumbert
        return result
    }
    
    private func divideTwoNumbers(dividing leftNumber: Double, with rightNumbert: Double) -> Double {
        let result: Double
        result = leftNumber / rightNumbert
        return result
    }
    
    func retrieveExpressionToParse(retrieving screenText: String) {
        text.append(screenText)
    }
    
    func parseExpressionAndReturnResult() -> String {
        
        var operationsToReduce = expressionToParse
        
        while operationsToReduce.count > 1 {
            
            var result: Double
            
            if expressionContainsPriorityOperators {
                if let index = operationsToReduce.firstIndex (where: { $0 == "*" || $0 == "/" }) {
                    let priorityResult: Double
                    let prioritySymbol = operationsToReduce[index]
                    let leftNumber = operationsToReduce[index - 1]
                    let rightNumber = operationsToReduce[index + 1]
                    
                    if let leftDouble = Double(leftNumber), let rightDouble = Double(rightNumber) {
                        if prioritySymbol == "*" {
                            priorityResult = multiplyTwoNumbers(multiplying: leftDouble, with: rightDouble)
                        } else {
                            priorityResult = divideTwoNumbers(dividing: leftDouble, with: rightDouble)
                        }
                        operationsToReduce.remove(at: index - 1)
                        operationsToReduce.remove(at: index - 1)
                        operationsToReduce.remove(at: index - 1)
                        operationsToReduce.insert("\(priorityResult)", at: index - 1)
                    }
                }
            }
            if operationsToReduce.count == 1 {
                text.removeAll()
                return operationsToReduce[0]
            } else {
                result = performNonPriorityOperations(leftNumber: Double(operationsToReduce[0])!,
                                                      rightNumber: Double(operationsToReduce[2])!,
                                                      mathSymbol: operationsToReduce[1])
                
                operationsToReduce = Array(operationsToReduce.dropFirst(3))
                operationsToReduce.insert("\(result)", at: 0)
            }
        }
        text.removeAll()
        return operationsToReduce[0]
    }
}








