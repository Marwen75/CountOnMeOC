//
//  CountOnMeUITests.swift
//  CountOnMeUITests
//
//  Created by Marwen Haouacine on 23/06/2020.
//  Copyright © 2020 Vincent Saluzzo. All rights reserved.
//

import XCTest

class CountOnMeUITests: XCTestCase {
    
    override func setUp() {
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    // MARK: - TESTS
    func testAllNumberButtons() {
        // UI tests must launch the application that they test.
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["0"].tap()
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.buttons["3"].tap()
        app.buttons["4"].tap()
        app.buttons["5"].tap()
        app.buttons["6"].tap()
        app.buttons["7"].tap()
        app.buttons["8"].tap()
        app.buttons["9"].tap()
        
        
        // Use recording to get started writing UI tests.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        
        XCTAssertEqual(app.textViews.element.value as? String, "0123456789")
    }
    
    func testExpressionWithNumberButtonsOperatorsAndEqual() {
        let app = XCUIApplication()
        app.launch()
        
        let button = app.buttons["2"]
        button.tap()
        app.buttons["+"].tap()
        button.tap()
        app.buttons["*"].tap()
        app.buttons["4"].tap()
        app.buttons["-"].tap()
        app.buttons["3"].tap()
        app.buttons["/"].tap()
        button.tap()
        app.buttons["="].tap()
        
        XCTAssertEqual(app.textViews.element.value as? String, "2 + 2 * 4 - 3 / 2 = 8.5")
    }
    
    func testClearButton() {
        let app = XCUIApplication()
        app.launch()
        
        app.buttons["1"].tap()
        app.buttons["2"].tap()
        app.buttons["+"].tap()
        app.buttons["8"].tap()
        app.buttons["Clear"].tap()
        
        XCTAssertEqual(app.textViews.element.value as? String, "")
    }
    
    func testButtonsAfterEqualWasPressed() {
        let app = XCUIApplication()
        app.launch()
        
        let button = app.buttons["1"]
        button.tap()
        
        let button2 = app.buttons["+"]
        button2.tap()
        button.tap()
        
        let button3 = app.buttons["="]
        button3.tap()
        
        let button4 = app.buttons["2"]
        button4.tap()
        button2.tap()
        button4.tap()
        button3.tap()
        
        XCTAssertEqual(app.textViews.element.value as? String, "2 + 2 = 4.0")
    }
    
    func testAlertDisplayer() {
        let app = XCUIApplication()
        app.launch()
        
        let button = app.buttons["1"]
        button.tap()
        
        let button2 = app.buttons["2"]
        button2.tap()
        app.buttons["+"].tap()
        button.tap()
        button2.tap()
        app.buttons["-"].tap()
        app.buttons["="].tap()
        app.alerts["Oups !"].scrollViews.otherElements.buttons["OK"].tap()
        
        XCTAssertEqual(app.textViews.element.value as? String, "")
    }
    
    func testLaunchPerformance() {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTOSSignpostMetric.applicationLaunch]) {
                XCUIApplication().launch()
            }
        }
    }
}
