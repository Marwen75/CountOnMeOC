//
//  CalculatorLogic.swift
//  CountOnMe
//
//  Created by Marwen Haouacine on 11/05/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import Foundation

class CalculatorLogic {
    
    let parser = Parser()
    
    private func add(adding leftNumber: Double, and rightNumbert: Double) -> Double {
        let result: Double
        result = leftNumber + rightNumbert
        return result
    }
    
    private func substract(substracting leftNumber: Double, and rightNumbert: Double) -> Double {
        let result: Double
        result = leftNumber - rightNumbert
        return result
    }
    
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
    
    private func handlePriorityOperations(symbols: inout [String], numbers: inout [Double]) {
        
        while symbols.contains("*") || symbols.contains("/") {
            
            if let i = symbols.firstIndex(where: {$0 == "*" || $0 == "/"}) {
                
                let priorityResult: Double
                let prioritySymbol = symbols[i]
                let leftNumber = numbers[i]
                let rightNumber = numbers[i + 1]
                
                if prioritySymbol == "*" {
                    priorityResult = multiply(multiplying: leftNumber, with: rightNumber)
                } else {
                    priorityResult = divide(dividing: leftNumber, with: rightNumber)
                }
                symbols.remove(at: i)
                numbers.remove(at: i)
                numbers.remove(at: i)
                numbers.insert(priorityResult, at: i)
            }
        }
    }
    
    func calculate(from expression: String) -> Double {
        
        var result: Double
        var (symbols, numbers) = parser.parseExpression(parsing: expression)
        handlePriorityOperations(symbols: &symbols, numbers: &numbers)
        
        while numbers.count > 1 {
            
            if symbols[0] == "+" {
                result = add(adding: numbers[0], and: numbers[1])
            } else {
                result = substract(substracting: numbers[0], and: numbers[1])
            }
            symbols.remove(at: 0)
            numbers = Array(numbers.dropFirst(2))
            numbers.insert(result, at: 0)
        }
        return numbers[0]
    }
}
