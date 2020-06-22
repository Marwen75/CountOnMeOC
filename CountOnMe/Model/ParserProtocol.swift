//
//  ParserProtocol.swift
//  CountOnMe
//
//  Created by Marwen Haouacine on 02/06/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import Foundation

// Here we create a protocol for the parser so anyone can use his own parser.

protocol ParserProtocol {
    
    func parseExpression(parsing expression: String) throws -> ([String], [Double])
}
