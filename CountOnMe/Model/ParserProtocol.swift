//
//  ParserProtocol.swift
//  CountOnMe
//
//  Created by Marwen Haouacine on 02/06/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import Foundation

protocol ParserProtocol {
    
    var mathSymbols: [String] { get }
    var numbers: [Double] { get }
    var expressionToParse: [String] { get }
    
    func parseExpression() -> ()
}
