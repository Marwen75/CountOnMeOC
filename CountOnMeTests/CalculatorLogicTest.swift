//
//  CalculatorLogicTest.swift
//  CountOnMeTests
//
//  Created by Marwen Haouacine on 11/05/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe

class CalculatorLogicTest: XCTestCase {
    var logic  = CalculatorLogic()
    
    override func setUp() {
        super.setUp()
        logic = CalculatorLogic()
    }
    
    func testGivenAnExpressionWithTwoNumbersAndPlusOperator_WhenTheExpressionIsParsedAndCalculated_ThenTheResultMustBeTheSum() {
        let _ = logic.retrieveExpressionToParse(retrieving: "10 + 10")
        
        let result = logic.parseExpressionAndReturnResult()
        
        XCTAssertTrue(result == "20.0")
    }
    
    func testGivenAnExpressionWithTwoNumbersAndMinusOperator_WhenTheExpressionIsParsedAndCalculated_ThenTheResultMustBeTheDifference() {
        let _ = logic.retrieveExpressionToParse(retrieving: "12 - 10")
        
        let result = logic.parseExpressionAndReturnResult()
        
        XCTAssertTrue(result == "2.0")
    }
    
    func testGivenAnExpressionWithTwoNumbersAndMultiplicationOperator_WhenTheExpressionIsParsedAndCalculated_ThenTheResultMustBeTheMultiplication() {
        
        let _ = logic.retrieveExpressionToParse(retrieving: "10 * 10")
        
        let result = logic.parseExpressionAndReturnResult()
        
        XCTAssertTrue(result == "100.0")
        
    }
    
    func testGivenAnExpressionWithTwoNumbersAndMultiplicationOperator_WhenTheExpressionIsParsedAndCalculated_ThenTheResultMustBeTheDivision() {
        
        let _ = logic.retrieveExpressionToParse(retrieving: "10 / 2")
        
        let result = logic.parseExpressionAndReturnResult()
        
        XCTAssertTrue(result == "5.0")
    }
    
    func testGivenMultipleNumbersWithMultipleOperators_WhenPriorityOperatorMultiplyIsInsideTheOperations_ThenTheResultMustBeCorrect() {
        let _ = logic.retrieveExpressionToParse(retrieving: "10 + 2 * 3")
        
        let result = logic.parseExpressionAndReturnResult()
        
        XCTAssertTrue(result == "16.0")
    }
    
    func testGivenMultipleNumbersWithMultipleOperators_WhenPriorityOperatorDivideIsInsideTheOperations_ThenTheResultMustBeCorrect() {
        let _ = logic.retrieveExpressionToParse(retrieving: "10 + 10 / 2")
        
        let result = logic.parseExpressionAndReturnResult()
        
        XCTAssertTrue(result == "15.0")
    }
    
    func testGivenMultipleNumbersWithMultipleOperators_WhenBothPriorityOperatorAreInsideTheOperations_ThenTheResultMustBeCorrect() {
        let _ = logic.retrieveExpressionToParse(retrieving: "10 + 3 * 2 + 4 / 2")
        
        let result = logic.parseExpressionAndReturnResult()
        
        XCTAssertTrue(result == "18.0")
    }
}

