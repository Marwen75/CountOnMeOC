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
    var controller = ViewController()
    
    override func setUp() {
        super.setUp()
        logic = CalculatorLogic()
        controller = ViewController()
    }
    
    func testGivenTwoNumber_WhenPlusOperatorTapped_ThenTheResultMustBeTheSum() {
        logic.numbers[0] = 2
        logic.numbers[1] = 2
        logic.mathSymbol[0] = "+"
        
        XCTAssert(logic.performOperations() == "4.00")
    }
    
    func testGivenTwoNumber_WhenMinusOperatorTapped_ThenTheResultMustBeTheDifference() {
       let _ = logic.numbers[0] = 2
       let _ = logic.mathSymbol[0] = "+"
       let _ = logic.numbers[1] = 2
        
        
        XCTAssert(logic.performOperations() == "5.00")
    }
    
    func testGivenTwoNumber_WhenMultiplyOperatorTapped_ThenTheResultMustBeTheMultiplication() {
       let _ = logic.numbers[0] = 2
       let _ = logic.mathSymbol[0] = "*"
       let _ = logic.numbers[1] = 2
    
    
        XCTAssert(logic.performOperations() == "4.00")
}

func testGivenTwoNumber_WhenDivideOperatorTapped_ThenTheResultMustBeTheDivision() {
       let _ = logic.numbers[0] = 4
       let _ = logic.mathSymbol[0] = "/"
       let _ = logic.numbers[1] = 2
    
    
        XCTAssert(logic.performOperations() == "2.00")
}

func testGivenSomeNumbers_WhenMultiplyOperatorTapped_ThenTheMultiplicationtMustBeThePriority() {
    
}

}

