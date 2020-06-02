//
//  ParserTestCase.swift
//  CountOnMeTests
//
//  Created by Marwen Haouacine on 27/05/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe

class ParserTestCase: XCTestCase {
    
    var parser = Parser()

    override func setUp() {
        parser = Parser()
    }
    
    func testGivenAnExpressionInAnArrayOfString_WhenTheExpressionIsParsed_ThenItMustBeSeparatedInTwoArraysOneArrayOfStringAndOneArrayOfDouble() {
        
        parser.expressionToParse += ["2", "+", "2", "*", "10"]
        
        parser.parseExpression()
        
        XCTAssertTrue(parser.mathSymbols == ["+", "*"])
        XCTAssertTrue(parser.numbers == [2, 2, 10])
        
    }
}
