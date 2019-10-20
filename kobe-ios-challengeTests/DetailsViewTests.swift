//
//  DetailsViewTests.swift
//  kobe-ios-challengeTests
//
//  Created by Livia Vasconcelos on 20/10/19.
//

import XCTest
@testable import kobe_ios_challenge

class DetailsViewTests: XCTestCase {
    
    var movie = MovieDTO(id:          1,
                         title:       "Title 1",
                         imagePath:   "image.jpg",
                         genres:      ["Genre 1", "Genre 2"],
                         releaseDate: "1900-10-10",
                         overview:    "Some overview")
    let viewController = MovieDetailsViewController()
    
    override func setUp() {
        super.setUp()
        
        viewController.movie = movie
        viewController.viewWillAppear(true)

    }
    
    func testCellInformation() {
        let title       = viewController.view.viewWithTag(1) as! UILabel
        let genres      = viewController.view.viewWithTag(2) as! UILabel
        let releaseDate = viewController.view.viewWithTag(3) as! UILabel
        let overview    = viewController.view.viewWithTag(4) as! UILabel
        
        checkLabelInformation(label: title, title: "Title 1", font: .systemFont(ofSize: 20, weight: .bold), textColor: .white)
        checkLabelInformation(label: genres, title: "Genre 1, Genre 2", font: .systemFont(ofSize: 14, weight: .semibold), textColor: .lightGray)
        checkLabelInformation(label: releaseDate, title: "1900-10-10", font: .systemFont(ofSize: 14, weight: .semibold), textColor: .lightGray)
        checkLabelInformation(label: overview, title: "Some overview", font: .systemFont(ofSize: 15, weight: .regular), textColor: .lightGray)
    }
    
    fileprivate func checkLabelInformation(label: UILabel, title: String, font: UIFont, textColor: UIColor) {
        XCTAssertEqual(label.text, title)
        XCTAssertEqual(label.font, font)
        XCTAssertEqual(label.textColor, textColor)
    }
}
