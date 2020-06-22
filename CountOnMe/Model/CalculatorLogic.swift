//
//  CalculatorLogic.swift
//  CountOnMe
//
//  Created by Marwen Haouacine on 11/05/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import Foundation

// This object will do all the math logic: Calculate and handle priority operations

class CalculatorLogic {
    // MARK: - Properties
    let parser: ParserProtocol
    
    init(parser: ParserProtocol) {
        self.parser = parser
    }
    // MARK: - Methods
    private func performOperations(mathSymbol: String, leftNumber: Double, rightNumber: Double) throws -> Double {
        switch mathSymbol {
        case "*":
            return multiply(multiplying: leftNumber, with: rightNumber)
        case "/":
            return try divide(dividing: leftNumber, with: rightNumber)
        case "+":
            return add(adding: leftNumber, and: rightNumber)
        case"-":
            return substract(substracting: leftNumber, and: rightNumber)
        default:
            throw CalculatorError.unKnownOperator
        }
    }
    
    private func add(adding leftNumber: Double, and rightNumber: Double) -> Double {
        let result: Double
        result = leftNumber + rightNumber
        return result
    }
    
    private func substract(substracting leftNumber: Double, and rightNumber: Double) -> Double {
        let result: Double
        result = leftNumber - rightNumber
        return result
    }
    
    private func multiply(multiplying leftNumber: Double, with rightNumber: Double) -> Double {
        let result: Double
        result = leftNumber * rightNumber
        return result
    }
    
    private func divide(dividing leftNumber: Double, with rightNumber: Double) throws -> Double {
        let result: Double
        if rightNumber == 0 {
            throw CalculatorError.divisionByZero
        }
        result = leftNumber / rightNumber
        return result
    }
    
    private func handlePriorityOperations(symbols: inout [String], numbers: inout [Double]) throws {
        
        while symbols.contains("*") || symbols.contains("/") {
            
            if let i = symbols.firstIndex(where: {$0 == "*" || $0 == "/"}) {
                
                let priorityResult: Double
                let prioritySymbol = symbols[i]
                let leftNumber = numbers[i]
                let rightNumber = numbers[i + 1]
                
                if prioritySymbol == "*" {
                    priorityResult = try performOperations(mathSymbol: prioritySymbol, leftNumber: leftNumber, rightNumber: rightNumber)
                } else {
                    priorityResult = try performOperations(mathSymbol: prioritySymbol, leftNumber: leftNumber, rightNumber: rightNumber)
                }
                symbols.remove(at: i)
                numbers.remove(at: i)
                numbers.remove(at: i)
                numbers.insert(priorityResult, at: i)
            }
        }
    }
    
    func calculate(from expression: String) throws -> Double {
        
        var result: Double
        var (symbols, numbers) = try parser.parseExpression(parsing: expression)
        try handlePriorityOperations(symbols: &symbols, numbers: &numbers)
        
        while numbers.count > 1 {
            
            result = try performOperations(mathSymbol: symbols[0], leftNumber: numbers[0], rightNumber: numbers[1])
            
            symbols.remove(at: 0)
            numbers = Array(numbers.dropFirst(2))
            numbers.insert(result, at: 0)
        }
        return numbers[0]
    }
}
