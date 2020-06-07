//
//  PriorityCalculationHandler.swift
//  CountOnMe
//
//  Created by Marwen Haouacine on 26/05/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import Foundation

class PriorityCalculationHandler {
    
    let parser = Parser()
    
    // private enum DivisionByZeroError: Error {
    //     case divisionByZeroIsImpossible(String)
    // }
    
    // private func divisionByZeroCheck(rightNumber: Double) throws {
    
    //     guard rightNumber != 0 else {
    
    //        throw DivisionByZeroError.divisionByZeroIsImpossible("On ne peut pas diviser par 0")
    //    }
    // }
    
    
    func handlePriorityOperators(prioritySymbols: inout [String], priorityNumbers: inout [Double]) {
        
        prioritySymbols.enumerated().forEach { i, symbol in
            if symbol == "*" || symbol == "/" {
                let leftPriorityNumber = priorityNumbers[i]
                let rightPriorityNumber = priorityNumbers[i + 1]
                priorityNumbers.remove(at: i)
                priorityNumbers.remove(at: i)
                prioritySymbols.remove(at: i)
                prioritySymbols.insert(symbol, at: 0)
                priorityNumbers.insert(rightPriorityNumber, at: 0)
                priorityNumbers.insert(leftPriorityNumber, at: 0)
            }
        }
    }
    
}
