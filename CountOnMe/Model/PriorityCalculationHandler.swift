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
    
    func handlePriorityOperators() {
        
        while mathSymbols.contains("*") || mathSymbols.contains("/") {
            if let priorityIndex = mathSymbols.firstIndex (where: { $0 == "*" || $0 == "/" }) {
                let priorityResult: Double
                let prioritySymbol = mathSymbols[priorityIndex]
                let leftNumber = numbers[priorityIndex]
                let rightNumber = numbers[priorityIndex + 1]
                
                if prioritySymbol == "*" {
                    priorityResult = leftNumber * rightNumber
                    mathSymbols.remove(at: priorityIndex)
                    numbers.remove(at: priorityIndex)
                    numbers.remove(at: priorityIndex)
                    numbers.insert(priorityResult, at: priorityIndex)
                } else if prioritySymbol == "/" {
                    priorityResult = leftNumber / rightNumber
                    mathSymbols.remove(at: priorityIndex)
                    numbers.remove(at: priorityIndex)
                    numbers.remove(at: priorityIndex)
                    numbers.insert(priorityResult, at: priorityIndex)
                }
            }
        }
    }
}
