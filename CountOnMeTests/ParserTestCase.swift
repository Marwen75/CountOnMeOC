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
    
    func testGivenAnExpressionInString_WhenTheExpressionIsParsed_ThenItMustBeSeparatedInTwoArraysOneArrayOfStringAndOneArrayOfDouble() {
        
        let testTuple = parser.parseExpression(parsing: "2 + 2 * 10")
        
        XCTAssertTrue(testTuple == (["+", "*"], [2, 2, 10]))
        
    }
    
    func testGivenAnExpressionInStringThatBeginsWithAnOperator_WhenTheExpressionIsParsed_ThenTheErrorMustBeCatched() {
        
        let testTuple = parser.parseExpression(parsing: "+ 2 + 2")
        
        XCTAssertTrue(testTuple == (["+"], [0, 0]))
    }
    
    func testGivenAnExpressionInStringWithOnlyTwoElements_WhenTheExpressionIsParsed_ThenTheErrorMustBeCatched() {
        
        let testTuple = parser.parseExpression(parsing: "2 +")
        
        XCTAssertTrue(testTuple == (["+"], [0, 0]))
    }
    
    func testGivenAnExpressionWithADivisionByZero_WhenTheExpressionIsParsed_ThenTheErrorMustBeCatched() {
        
        let testTuple = parser.parseExpression(parsing: "2 + 2 + 2 / 0")
        
        XCTAssertTrue(testTuple == (["+"], [0, 0]))
    }
    
    func testGivenAnExpressionThatEndsWithAnOperator_WhenTheExpressionIsParsed_ThenTheErrorMustBeCatched() {
        
        let testTuple = parser.parseExpression(parsing: "2 * 4 / 2 +")
        
        XCTAssertTrue(testTuple == (["+"], [0, 0]))
    }
}
