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
    let priorityHandler = PriorityCalculationHandler()
    
    private func performOperations(leftNumber: Double, rightNumber: Double, mathSymbol: String) -> Double {
        
        let result: Double
        
        switch mathSymbol {
        case "*":
            result = multiply(multiplying: leftNumber, with: rightNumber)
        case "/":
            result = divide(dividing: leftNumber, with: rightNumber)
        case "+":
            result = add(adding: leftNumber, and: rightNumber)
        case "-":
            result = substract(substracting: leftNumber, and: rightNumber)
        default:
            fatalError()
        }
        return result
    }
    
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
    
    func calculate(from expression: String) -> Double {
        var priorityResult: Double
        var result: Double
        var (symbols, numbers) = parser.parseExpression(parsing: expression)
        priorityHandler.handlePriorityOperators(prioritySymbols: &symbols, priorityNumbers: &numbers)
        
        while symbols.contains("*") || symbols.contains("/") {
            
            priorityResult = performOperations(leftNumber: numbers[0], rightNumber: numbers[1], mathSymbol: symbols[0])
            
            symbols.remove(at: 0)
            numbers = Array(numbers.dropFirst(2))
            numbers.append(priorityResult)
           // if symbols.contains("+") || symbols.contains("-") {
              //  if let goodIndex = symbols.lastIndex (where: { $0 == "*" ||  $0 == "/" }) {
                  //  numbers.insert(priorityResult, at: goodIndex)
                   // numbers.removeLast()
              //  }
           // }
        }
        while numbers.count > 1 {
            
            result = performOperations(leftNumber: numbers[0],
                                       rightNumber: numbers[1],
                                       mathSymbol: symbols[0])
            symbols.remove(at: 0)
            numbers = Array(numbers.dropFirst(2))
            numbers.insert(result, at: 0)
        }
        return numbers[0]
    }
}
