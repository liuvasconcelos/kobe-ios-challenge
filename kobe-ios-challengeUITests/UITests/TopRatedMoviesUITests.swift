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
        
        app.launchEnvironment = ["TESTING": "YES"]
        app.launchArguments  += ["-AppleLocale", "en_US"]
        app.launchArguments  += ["-AppleLanguages", "(en)"]
        app.launch()
    }
    
    func testOpeningScreenWithCorrectInformation() {
        sleep(10)
        self.checkViewInformation()
        self.checkTableViewInformation()
    }
    
    fileprivate func checkViewInformation() {
        //checar texto "Top Rated"
        // "Search by name"
    }
    
    fileprivate func checkTableViewInformation() {
        // quantidade de celulas
        // checar informacao das células - com gêneros
    }
    
    func testSearchForAMovie() {
        // scroll para baixo - digitar "Search"
        // checar informacao das células - com gêneros
        // quantidade
    }
    
    func testSearchForAMovieAndSomeErrorOccures() {
        // checar alert
    }
    
    func testGoToDetails() {
        // clique na célula - checar textos e overview
    }

}

