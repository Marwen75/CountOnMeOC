//
//  ParserProtocol.swift
//  CountOnMe
//
//  Created by Marwen Haouacine on 02/06/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import Foundation

protocol ParserProtocol {
    
    func parseExpression(parsing expression: String) throws -> ([String], [Double])
}
