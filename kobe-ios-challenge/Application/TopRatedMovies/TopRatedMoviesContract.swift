//
//  TopRatedMoviesContract.swift
//  kobe-ios-challenge
//
//  Created by Livia Vasconcelos on 18/10/19.
//

import Foundation

protocol TopRatedMoviesViewContract {
    
}

protocol TopRatedMoviedPresenterContract {
    func getAllGenres()
    func findMovies(query: String, page: Int)
}
