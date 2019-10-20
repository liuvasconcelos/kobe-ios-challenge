//
//  MovieDetails.swift
//  kobe-ios-challengeUITests
//
//  Created by Livia Vasconcelos on 19/10/19.
//

import XCTest

class MovieDetails {
    let app: XCUIApplication
    
    init(app: XCUIApplication) {
        self.app = app
    }
    
    var firstMovieTitle: XCUIElement {
        return app.staticTexts["Film 1"]
    }
    
    var firstMovieGenres: XCUIElement {
        return app.staticTexts["Genre 1, Genre 2, Genre 3"]
    }
    
    var firstMovieReleaseDate: XCUIElement {
        return app.staticTexts["1995-10-20"]
    }
    
    var firstMovieOverview: XCUIElement {
        return app.staticTexts["Description for first film."]
    }
    
    var navigationBarTitle: String {
        return navigationBarButton.label
    }
    
    var navigationBarButton: XCUIElement {
        return app.navigationBars.firstMatch.buttons.firstMatch
    }
    
    func goBackToList() {
        if #available(iOS 13.0, *) {
            app.swipeDown()
        } else  {
            self.navigationBarButton.tap()
        }
        
        sleep(1)
    }
}


