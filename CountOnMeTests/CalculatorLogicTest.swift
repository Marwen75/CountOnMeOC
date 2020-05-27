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
    
    var logic = CalculatorLogic()
    
    override func setUp() {
        super.setUp()
        logic = CalculatorLogic()
    }
    
    func testGivenAnExpressionWithTwoNumbersAndPlusOperator_WhenTheExpressionIsParsedAndCalculated_ThenTheResultMustBeTheSum() {
        
        let result = logic.calculate(from: ["1", "+", "1"])
        
        XCTAssertTrue(result == 2.0)
    }
    
    func testGivenAnExpressionWithTwoNumbersAndMinusOperator_WhenTheExpressionIsParsedAndCalculated_ThenTheResultMustBeTheDifference() {
        let result = logic.calculate(from: ["12", "-", "8"])
        
        XCTAssertTrue(result == 4.0)
    }
    
    func testGivenAnExpressionWithTwoNumbersAndMultiplicationOperator_WhenTheExpressionIsParsedAndCalculated_ThenTheResultMustBeTheMultiplication() {
        
        let result = logic.calculate(from: ["4", "*", "4"])
        
        XCTAssertTrue(result == 16.0)
        
    }
    
    func testGivenAnExpressionWithTwoNumbersAndMultiplicationOperator_WhenTheExpressionIsParsedAndCalculated_ThenTheResultMustBeTheDivision() {
        
        let result = logic.calculate(from: ["12", "/", "2"])
        
        XCTAssertTrue(result == 6.0)
    }
    
    func testGivenMultipleNumbersWithMultipleOperators_WhenPriorityOperatorMultiplyIsInsideTheOperations_ThenTheResultMustBeCorrect() {
        let result = logic.calculate(from: ["2", "+", "6", "*", "2"])
        
        XCTAssertTrue(result == 14.0)
    }
    
    func testGivenMultipleNumbersWithMultipleOperators_WhenPriorityOperatorDivideIsInsideTheOperations_ThenTheResultMustBeCorrect() {
        let result = logic.calculate(from: ["10", "+", "12", "/", "2"])
        
        XCTAssertTrue(result == 16.0)
    }
    
    func testGivenMultipleNumbersWithMultipleOperators_WhenBothPriorityOperatorAreInsideTheOperations_ThenTheResultMustBeCorrect() {
        let result = logic.calculate(from: ["10", "+", "2", "*", "3", "-", "14", "/", "2"])
        
        XCTAssertTrue(result == 9.0)
    }
}

