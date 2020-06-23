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
    
    var parser: Parser!
    
    override func setUp() {
        super.setUp()
        parser = Parser()
    }
    
    override func tearDown() {
        parser = nil
        super.tearDown()
    }
    // MARK: - TESTS
    func testGivenAnExpressionInString_WhenTheExpressionIsParsed_ThenItMustBeSeparatedInTwoArraysOneArrayOfStringAndOneArrayOfDouble() throws {
        
        let testTuple = try parser.parseExpression(parsing: "2 + 2 * 10") 
        
        XCTAssertTrue(testTuple == (["+", "*"], [2, 2, 10]))
        
    }
    
    func testGivenAnExpressionInStringThatBeginsWithAnOperator_WhenTheExpressionIsParsed_ThenTheErrorMustBeThrowned() throws {
        let expectedError = CalculatorError.operationBeginsWithOperator
        var error: CalculatorError?
        
        XCTAssertThrowsError(try parser.parseExpression(parsing: "+ 2 + 2")) { thrownError in
            error = thrownError as? CalculatorError
        }
        
        XCTAssertTrue(expectedError.errorDescription == "Oups !")
        
        XCTAssertTrue(expectedError.failureReason == "Il vaut mieux commencer par un chiffre.")
        
        XCTAssertEqual(expectedError, error)
    }
    
    func testGivenAnExpressionInStringWithOnlyTwoElements_WhenTheExpressionIsParsed_ThenTheErrorMustBeThrowned() throws {
        let expectedError = CalculatorError.incorrectExpression
        var error: CalculatorError?
        
        XCTAssertThrowsError(try parser.parseExpression(parsing: "2 +")) { thrownError in
            error = thrownError as? CalculatorError
        }
        
        XCTAssertTrue(expectedError.failureReason == "Votre expression est incorrecte.")
        
        XCTAssertEqual(expectedError, error)
    }
    
    func testGivenAnExpressionThatEndsWithAnOperator_WhenTheExpressionIsParsed_ThenTheErrorMustBeThrowned() throws {
        let expectedError = CalculatorError.incorrectExpression
        var error: CalculatorError?
        
        XCTAssertThrowsError(try parser.parseExpression(parsing: "2 + 2 +")) { thrownError in
            error = thrownError as? CalculatorError
        }
        
        XCTAssertTrue(expectedError.failureReason == "Votre expression est incorrecte.")
        
        XCTAssertEqual(expectedError, error)
    }
    
    func testGivenAnExpressionWithTooMuchMathSymbols_WhenTheExpressionIsParsedAndThereIsTooMuchSymbols_ThenTheErrorMustBeThrowned() throws {
        let expectedError = CalculatorError.incorrectExpression
        var error: CalculatorError?
        
        XCTAssertThrowsError(try parser.parseExpression(parsing: "2 + 2 + + + 2")) { thrownError in
            error = thrownError as? CalculatorError
        }
        
        XCTAssertTrue(expectedError.failureReason == "Votre expression est incorrecte.")
        
        XCTAssertEqual(expectedError, error)
    }
    
    func testGivenAnExpressionButEqualWasAlreadyPressed_WhenTheExpressionIsParsedAndAndEqualIsFound_ThenTheErrorMustBeThrowned() throws {
        let expectedError = CalculatorError.equalIsAlreadyPressed
        var error: CalculatorError?
        
        XCTAssertThrowsError(try parser.parseExpression(parsing: "2 + 2 + 2 = 6")) { thrownError in
            error = thrownError as? CalculatorError
        }
        
        XCTAssertTrue(expectedError.failureReason == "Vous avez déja appuyé sur égal veuillez commencer un nouveau calcul.")
        
        XCTAssertEqual(expectedError, error)
    }
}
