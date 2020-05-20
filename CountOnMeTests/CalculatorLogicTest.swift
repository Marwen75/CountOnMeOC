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
    
    func testGivenTwoNumber_WhenPlusOperatorTapped_ThenTheResultMustBeTheSum() {
        let leftNumber: Double = 10.0
        let mathSymbol: String = "+"
        let rightNumber: Double = 10.0
        
        XCTAssert(logic.performOperations(leftNumber: leftNumber, rightNumber: rightNumber, mathSymbol: mathSymbol) == 20.0)
    }
    
    func testGivenTwoNumber_WhenMinusOperatorTapped_ThenTheResultMustBeTheDifference() {
        let leftNumber: Double = 10.0
        let mathSymbol: String = "-"
        let rightNumber: Double = 5.0
        
        XCTAssert(logic.performOperations(leftNumber: leftNumber, rightNumber: rightNumber, mathSymbol: mathSymbol) == 5.0)
    }
    
    func testGivenTwoNumber_WhenMultiplyOperatorTapped_ThenTheResultMustBeTheMultiplication() {
        let leftNumber: Double = 10.0
        let mathSymbol: String = "*"
        let rightNumber: Double = 10.0
        
        XCTAssert(logic.performOperations(leftNumber: leftNumber, rightNumber: rightNumber, mathSymbol: mathSymbol) == 100.0)
    }
    
    func testGivenTwoNumber_WhenDivideOperatorTapped_ThenTheResultMustBeTheDivision() {
        let leftNumber: Double = 10.0
        let mathSymbol: String = "/"
        let rightNumber: Double = 2.0
        
        XCTAssert(logic.performOperations(leftNumber: leftNumber, rightNumber: rightNumber, mathSymbol: mathSymbol) == 5.0)
    }
    
}

