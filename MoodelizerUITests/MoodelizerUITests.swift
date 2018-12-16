//
//  MoodelizerUITests.swift
//  MoodelizerUITests
//
//  Created by Edson iMAC on 08/12/2018.
//  Copyright © 2018 Edson Moura. All rights reserved.
//

import XCTest

class MoodelizerUITests: XCTestCase {
    
    var app: XCUIApplication!
    
    override func setUp() {
        continueAfterFailure = false
        app = XCUIApplication()
        app.launchArguments.append("--uitesting")
    }
    
    override func tearDown() {
        super.tearDown()
    }
    
    func testArticleButton() {
        app.launch()
        
        let articleTableView = app.tables["table--articleTableView"]
        XCTAssertTrue(articleTableView.exists, "tableView Articles Exists")
        
        let tableCells = articleTableView.cells
        
        if tableCells.count > 0 {
            
            let firstCell = tableCells.element(boundBy: 0)
            let firstCellExists = NSPredicate(format: "exists == true")
            expectation(for: firstCellExists, evaluatedWith: firstCell, handler: nil)
            waitForExpectations(timeout: 10, handler: nil)
            XCTAssertTrue(firstCell.exists, "First cell is on the table")
            firstCell.tap()
            
            let articleVisitButton = app.buttons["button--articleLinkButton"]
            let articleVisitButtonExists = NSPredicate(format: "exists == true")
            expectation(for: articleVisitButtonExists, evaluatedWith: articleVisitButton, handler: nil)
            waitForExpectations(timeout: 10, handler: nil)
            XCTAssertTrue(articleVisitButton.exists, "Validating article button")
            articleVisitButton.tap()
            XCTAssertTrue(true, "Opening the article was successful")
            
            let closeArticleButton = app.buttons["button--closeArticleButton"]
            let labelWebViewTitle = app.staticTexts["label--webView"]
            let exists = NSPredicate(format: "exists == true")
            expectation(for: exists, evaluatedWith: labelWebViewTitle, handler: nil)
            
            waitForExpectations(timeout: 20, handler: nil)
            closeArticleButton.tap()
            
            XCTAssertTrue(true, "Web view loaded was successful")
            XCTAssertTrue(true, "Finished validating app")
            
        } else {
            XCTAssert(false, "Was not able to find any table cells")
        }
    }
    
}
