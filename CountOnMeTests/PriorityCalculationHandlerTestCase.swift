//
//  PriorityManagerTestCase.swift
//  CountOnMeTests
//
//  Created by Marwen Haouacine on 26/05/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import XCTest
@testable import CountOnMe

class PriorityManagerTestCase: XCTestCase {
    
    var priorityHandler = PriorityCalculationHandler(mathSymbols: [], numbers: [])
    
    override func setUp() {
        super.setUp()
        priorityHandler = PriorityCalculationHandler(mathSymbols: [], numbers: [])
    }
    
    func testGivenAnExpressionWithNumbersAndOnePriorityOperator_WhenTheExpressionIsParsedAndCalculated_ThenTheResultOfThePriorityOperationMustBeHandled() {
        priorityHandler.mathSymbols += ["+", "*",]
        priorityHandler.numbers += [12, 2, 3]
        
        priorityHandler.handlePriorityOperators()
        
        XCTAssert(priorityHandler.numbers[1] == 6)
        XCTAssert(priorityHandler.mathSymbols.count == 1)
    }
}
