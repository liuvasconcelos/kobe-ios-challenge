//
//  TopRatedMoviesUITests.swift
//  kobe-ios-challengeUITests
//
//  Created by Livia Vasconcelos on 19/10/19.
//

import XCTest
@testable import kobe_ios_challenge

class TopRatedMoviesUITests: XCTestCase {
    let app = XCUIApplication()
    
    var bundle:         Bundle?
    var topRatedScreen: TopRated?
    var movieDetails:   MovieDetails?
        
    override func setUp() {
        super.setUp()
        bundle         = Bundle(for: TopRatedMoviesUITests.self)
        topRatedScreen = TopRated(app: app)
        movieDetails   = MovieDetails(app: app)
    }
    
    fileprivate func launchApp(isErrorTest: Bool = false) {
        var environment = ["TESTING": "YES"]
        if isErrorTest { environment.updateValue("YES", forKey: "ERRORTEST") }
        
        app.launchEnvironment = environment
        app.launchArguments  += ["-AppleLocale", "en_US"]
        app.launchArguments  += ["-AppleLanguages", "(en)"]
        app.launch()
    }
    
    func testOpeningScreenWithCorrectInformation() {
        self.launchApp()
        self.checkViewInformation()
        self.checkTableViewInformation()
    }
    
    fileprivate func checkViewInformation() {
        XCTAssertTrue(topRatedScreen?.topRatedNavigationBarTitle.exists ?? false)
        XCTAssertEqual(topRatedScreen?.searchFieldLabel, "Search by name")
    }
    
    fileprivate func checkTableViewInformation() {
        XCTAssertEqual(topRatedScreen?.topRatedTableView.cells.count, 5)
    
        let firstCellTitle  = topRatedScreen?.topRatedFirstCell.staticTexts["Film 1"]
        let firstCellGenres = topRatedScreen?.topRatedFirstCell.staticTexts["Genre 1, Genre 2, Genre 3"]
        let firstCellDate   = topRatedScreen?.topRatedFirstCell.staticTexts["1995-10-20"]
        
        self.assertLabelExists(element: firstCellTitle!)
        self.assertLabelExists(element: firstCellGenres!)
        self.assertLabelExists(element: firstCellDate!)
    }
    
    fileprivate func assertLabelExists(element: XCUIElement) {
        XCTAssertTrue(element.exists)
    }
    
    func testApiConsumptionAndSomeErrorOccures() {
        self.launchApp(isErrorTest: true)
        self.checkViewInformation()
        self.checkAlertInformation()
        
    }
    
    fileprivate func checkAlertInformation() {
        XCTAssertTrue(topRatedScreen?.errorMessage.exists ?? false)
    }
    
    func testGoToDetails() {
        self.launchApp()
        
        if #available(iOS 13.0, *) {} else {
            topRatedScreen?.clickOnFirstCell()
            self.checkDetailsViewInformation()
        }
    
    }
    
    fileprivate func checkDetailsViewInformation() {
        assertLabelExists(element: movieDetails!.firstMovieTitle)
        assertLabelExists(element: movieDetails!.firstMovieGenres)
        assertLabelExists(element: movieDetails!.firstMovieReleaseDate)
        assertLabelExists(element: movieDetails!.firstMovieOverview)
        XCTAssertEqual(movieDetails!.navigationBarTitle, "Top Rated Movies")
        
        self.goBackToList()
    }

    fileprivate func goBackToList() {
        movieDetails?.goBackToList()
        
        XCTAssertTrue(topRatedScreen?.topRatedNavigationBarTitle.exists ?? false)
        self.checkTableViewInformation()
    }
}

