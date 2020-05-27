//
//  CalculatorLogic.swift
//  CountOnMe
//
//  Created by Marwen Haouacine on 11/05/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import Foundation

class CalculatorLogic {
    
    private var parser = Parser()
    
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
    
    private func getRidOfLastOperations() {
        if !parser.numbers.isEmpty && !parser.mathSymbols.isEmpty {
            parser.numbers.removeAll()
            parser.expressionToParse.removeAll()
            parser.mathSymbols.removeAll()
        }
    }
    
    func calculate(from expression: [String]) -> Double {
        getRidOfLastOperations()
        parser.expressionToParse += expression
        parser.parseExpression()
        var symbols = parser.mathSymbols
        var numbers = parser.numbers
        let priorityHandler = PriorityCalculationHandler(mathSymbols: symbols, numbers: numbers)
        while numbers.count > 1 {
            var result: Double
            if symbols.contains("*") || symbols.contains("/") {
                priorityHandler.handlePriorityOperators()
                symbols = priorityHandler.mathSymbols
                numbers = priorityHandler.numbers
                if numbers.count == 1 {
                    return numbers[0]
                }
            } else {
                result = performOperations(leftNumber: numbers[0], rightNumber: numbers[1], mathSymbol: symbols[0])
                
                symbols.remove(at: 0)
                numbers = Array(numbers.dropFirst(2))
                numbers.insert(result, at: 0)
            }
        }
        return numbers[0]
    }
}
