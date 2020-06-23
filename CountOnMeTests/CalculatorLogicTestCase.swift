//
//  CalculatorLogicTest.swift
//  CountOnMeTests
//
//  Created by Marwen Haouacine on 11/05/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe

class CalculatorLogicTestCase: XCTestCase {

    var logic: CalculatorLogic!

    override func setUp() {
        super.setUp()
        logic = CalculatorLogic(parser: Parser())
    }
    override func tearDown() {
        logic = nil
        super.tearDown()
    }
    //MARK: - TESTS
    func testGivenAnExpressionWithTwoNumbersAndPlusOperator_WhenTheExpressionIsParsedAndCalculated_ThenTheResultMustBeTheSum() throws {
        
        let result = try logic.calculate(from: "1 + 1")
        
        XCTAssertTrue(result == 2.0)
    }
    
    func testGivenAnExpressionWithForNumbersAndNonPriorityOperators_WhenTheExpressionIsParsedAndCalculated_ThenTheResultMustBeCorrect() throws {
        
        let result = try logic.calculate(from: "12 + 12 - 4")
        
        XCTAssertTrue(result == 20.0)
    }
    
    func testGivenAnExpressionWithTwoNumbersAndMinusOperator_WhenTheExpressionIsParsedAndCalculated_ThenTheResultMustBeTheDifference() throws {
        let result = try logic.calculate(from: "12 - 8")
        
        XCTAssertTrue(result == 4.0)
    }
    
    func testGivenAnExpressionWithTwoNumbersAndMultiplicationOperator_WhenTheExpressionIsParsedAndCalculated_ThenTheResultMustBeTheMultiplication() throws {
        
        let result = try logic.calculate(from: "4 * 4")
        
        XCTAssertTrue(result == 16.0)
        
    }
    
    func testGivenAnExpressionWithTwoNumbersAndMultiplicationOperator_WhenTheExpressionIsParsedAndCalculated_ThenTheResultMustBeTheDivision() throws {
        
        let result = try logic.calculate(from: "12 / 2")
        
        XCTAssertTrue(result == 6.0)
    }
    
    func testGivenMultipleNumbersWithMultipleOperators_WhenPriorityOperatorMultiplyIsInsideTheOperations_ThenTheResultMustBeCorrect() throws {
        let result = try logic.calculate(from: "2 + 6 * 2")
        
        XCTAssertTrue(result == 14.0)
    }
    
    func testGivenMultipleNumbersWithMultipleOperators_WhenPriorityOperatorDivideIsInsideTheOperations_ThenTheResultMustBeCorrect() throws {
        let result = try logic.calculate(from: "10 + 12 / 2")
        
        XCTAssertNoThrow(try logic.calculate(from: "10 + 12 / 2"))
        
        XCTAssertTrue(result == 16.0)
    }
    
    func testGivenMultipleNumbersWithMultipleOperators_WhenBothPriorityOperatorAreInsideTheOperations_ThenTheResultMustBeCorrect() throws {
        let result = try logic.calculate(from: "10 + 2 * 3 - 14 / 2")
        
        XCTAssertTrue(result == 9.0)
    }
    
    func testGivenMultipleOperationsWithTheSamePriorityOperator_WhenTheCalculIsMade_ThenThePriorityMustBeRespected() throws {
        let result = try logic.calculate(from: "2 * 2 + 2 * 4")
        
        XCTAssertTrue(result == 12.0)
    }
    
    func testGivenAPreviousOperationInTheArray_WhenANewCalculBegins_ThenTheArrayMustBeEmptiedAndRefillWithNewCalculation() throws {
        _ = try logic.calculate(from: "2 * 2 + 2 * 4")
        
        let newOperationResult = try logic.calculate(from: "10 + 2 * 3 - 14 / 2")
        
        XCTAssertTrue(newOperationResult == 9.0)
    }
    
    func testGivenAnExpressionWithADivisionByZero_WhenTheOperationIsMade_ThenTheErrorMustBeThrowned() throws {
        let expectedError = CalculatorError.divisionByZero
        var error: CalculatorError?
        
        XCTAssertThrowsError(try logic.calculate(from: "14 + 3 / 0")) { thrownError in
            error = thrownError as? CalculatorError
        }
        
        XCTAssertTrue(expectedError.failureReason == "La division par zéro est impossible.")
        
        XCTAssertEqual(expectedError, error)
    }
    
    func testGivenAnExpressionWithAnUnknownOperator_WhenTheOperationIsMade_ThenTheErrorMustBeThrowned() throws {
        let expectedError = CalculatorError.unKnownOperator
        var error: CalculatorError?
        
        XCTAssertThrowsError(try logic.calculate(from: "14 _ 3")) { thrownError in
            error = thrownError as? CalculatorError
        }
        
        XCTAssertTrue(expectedError.failureReason == "Opérateur inconnu.")
        
        XCTAssertEqual(expectedError, error)
    }
}

