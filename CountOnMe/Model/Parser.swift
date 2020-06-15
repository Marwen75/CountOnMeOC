//
//  Parser.swift
//  CountOnMe
//
//  Created by Marwen Haouacine on 26/05/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import Foundation

class Parser: ParserProtocol {
    
    var alertDisplayer: ((_ title: String, _ message: String) -> Void)?
    
    private enum SynthaxError: Error {
        case notEnoughElementsInExpression
        case operatorAtTheEndOfExpression
        case divisionByzero
        case twoOperators
        case operationBeginsWithOperator
    }
    
    private func checkingDivisionByZeroInExpression(elements: [String]) -> Bool {
        if elements.contains("/") {
            if let indexOfDivisionSymbol = elements.firstIndex(of: "/") {
                if elements[indexOfDivisionSymbol + 1] == "0" {
                    return false
                }
            }
        }
        return true
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
    
    private func checkForError(elements: [String]) throws {
        if !expressionHaveEnoughElement(elements: elements) {
            throw SynthaxError.notEnoughElementsInExpression
        } else if !expressionIsCorrect(elements: elements) {
            throw SynthaxError.operatorAtTheEndOfExpression
        } else if !checkingDivisionByZeroInExpression(elements: elements) {
            throw SynthaxError.divisionByzero
        } else if expressionBeginWithOperator(elements: elements) {
            throw SynthaxError.operationBeginsWithOperator
        }
    }
    
    func parseExpression(parsing expression: String) -> ([String], [Double]) {
        
        let expressionToParse: [String] = expression.split(separator: " ").map { "\($0)" }
        do {
            try checkForError(elements: expressionToParse)
        } catch SynthaxError.notEnoughElementsInExpression {
            alertDisplayer?("Oups", "Votre expression est incorrecte")
            return (["+"], [0, 0])
        } catch SynthaxError.operatorAtTheEndOfExpression {
            alertDisplayer?("Oups", "Votre expression est incorrecte")
            return (["+"], [0, 0])
        }  catch SynthaxError.divisionByzero {
            alertDisplayer?("Oups", "On ne peut pas diviser par zéro")
            return (["+"], [0, 0])
        } catch SynthaxError.operationBeginsWithOperator {
            alertDisplayer?("Oups", "Veuillez commencer par un chiffre")
            return (["+"], [0, 0])
        } catch {
            alertDisplayer?("Oups", "Une erreur est survenue")
            return (["+"], [0, 0])
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
        return (mathSymbols, numbers)
    }
} 
