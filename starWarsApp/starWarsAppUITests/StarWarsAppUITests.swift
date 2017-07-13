//
//  starWarsAppUITests.swift
//  starWarsAppUITests
//
//  Created by retina on 12/07/17.
//  Copyright © 2017 CWI. All rights reserved.
//

import XCTest

class StarWarsAppUITests: XCTestCase {
        
    override func setUp() {
        super.setUp()
        
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        XCUIApplication().launch()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNavigateInPeopleFlowFromStartToEndAndBackAgainWithNoTextSearch() {
        
        let app = XCUIApplication()
        app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element(boundBy: 0).children(matching: .button).element.tap()
        app.tables.staticTexts["Luke Skywalker"].tap()
        
        let leftArrowButton = app.buttons["left arrow"]
        leftArrowButton.tap()
        leftArrowButton.tap()
        
    }
}
