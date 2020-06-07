//
//  Parser.swift
//  CountOnMe
//
//  Created by Marwen Haouacine on 26/05/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import Foundation

class Parser: ParserProtocol {
    
        
    func parseExpression(parsing expression: String) -> ([String], [Double]) {
        
        let expressionToParse: [String] = expression.split(separator: " ").map { "\($0)" }
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
