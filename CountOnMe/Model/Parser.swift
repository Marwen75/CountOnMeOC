//
//  Parser.swift
//  CountOnMe
//
//  Created by Marwen Haouacine on 26/05/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import Foundation

class Parser: ParserProtocol {

    var mathSymbols: [String] = []
    var numbers: [Double] = []
    var expressionToParse: [String] = []
    
    func parseExpression() {
        expressionToParse.enumerated().forEach { (i, elements) in
            if i % 2 != 0 {
                mathSymbols.append(elements)
            } else {
                if let myDouble = Double(elements) {
                numbers.append(myDouble)
                }
            }
        }
    }
} 
