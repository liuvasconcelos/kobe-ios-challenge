//
//  TopRated.swift
//  kobe-ios-challengeUITests
//
//  Created by Livia Vasconcelos on 19/10/19.
//

import XCTest

class TopRated {
    let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    var topRatedNavigationBarTitle: XCUIElement {
        return app.navigationBars.staticTexts["Top Rated Movies"]
    }
    
    var searchFieldLabel: String {
        return app.searchFields.firstMatch.label
    }
    
    var topRatedTableView: XCUIElement {
        return app.tables.firstMatch
    }
    
    var topRatedFirstCell: XCUIElement {
        return topRatedTableView.cells.firstMatch
    }
    
    var errorMessage: XCUIElement {
        return app.staticTexts["Something happened and your data could not be loaded, please try again later."]
    }
    
    func clickOnFirstCell() {
        if #available(iOS 13.0, *) {} else {
            topRatedFirstCell.tap()
        }
        
    }
}

