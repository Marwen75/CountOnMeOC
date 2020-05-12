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
    
    func testGivenANumber_WhenPlusOperatorTapped_ThenTheResultMustBeTheSum() {
        logic.firstNumber = 5
        logic.secondNumber = 5
        logic.sign = "+"
        
        logic.calculate()
        
        logic.firstResult = 10
    }

}
