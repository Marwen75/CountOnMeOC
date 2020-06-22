//
//  Parser.swift
//  CountOnMe
//
//  Created by Marwen Haouacine on 26/05/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import Foundation

// This object will parse the data from the screen, put them in two arrays and will also throw synthax errors

class Parser: ParserProtocol {
    // MARK: - Methods
    private func checkForExtraSymbols(inside matshSymbols: [String], and numbers: [Double]) -> Bool {
        if matshSymbols.count >= numbers.count {
            return true
        }
        return false
    }
    
    private func expressionIsCorrect(elements: [String]) -> Bool {
        if elements.last == "+" || elements.last == "-" || elements.last == "/" || elements.last == "*" || elements.last == "" {
            return false
        }
            return true
    }
    
    private func expressionHaveEnoughElement(elements: [String]) -> Bool {
        if elements.count < 3 {
            return false
        }
        return true
    }
    
    private func expressionBeginWithOperator(elements: [String]) -> Bool {
        if elements.first == "+" || elements.first == "-" || elements.first == "/" || elements.first == "*" || elements.first == "" {
            return true
        }
        return false
    }
    
    private func isEqualAlreadyPressed(elements: [String]) -> Bool {
        if elements.contains("=") {
            return true
        }
        return false 
    }
    
    func parseExpression(parsing expression: String) throws -> ([String], [Double]) {
        
        let expressionToParse: [String] = expression.split(separator: " ").map { "\($0)" }
        
        if !expressionHaveEnoughElement(elements: expressionToParse) {
            throw CalculatorError.incorrectExpression
        } else if !expressionIsCorrect(elements: expressionToParse) {
            throw CalculatorError.incorrectExpression
        } else if expressionBeginWithOperator(elements: expressionToParse) {
            throw CalculatorError.operationBeginsWithOperator
        } else if isEqualAlreadyPressed(elements: expressionToParse) {
            throw CalculatorError.equalIsAlreadyPressed
        }
        
        var mathSymbols: [String] = []
        var numbers: [Double] = []
        
        expressionToParse.enumerated().forEach { (i, elements) in
            if i % 2 != 0 {
                mathSymbols.append(elements)
            } else {
                if let myDouble = Double(elements) {
                    numbers.append(myDouble)
                }
            }
        }
        if checkForExtraSymbols(inside: mathSymbols, and: numbers) {
            throw CalculatorError.incorrectExpression
        }
        return (mathSymbols, numbers)
    }
}
