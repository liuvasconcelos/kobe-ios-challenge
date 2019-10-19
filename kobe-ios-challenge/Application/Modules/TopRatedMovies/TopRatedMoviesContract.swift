//
//  TopRatedMoviesContract.swift
//  kobe-ios-challenge
//
//  Created by Livia Vasconcelos on 18/10/19.
//

import Foundation

protocol TopRatedMoviesViewContract {
    func showErrorMessage()
    func showMovies(_ movies: [MovieDTO])
}

protocol TopRatedMoviedPresenterContract {
    func findMovies(query: String, page: Int)
}

protocol MovieCellViewContract: class {
    func didClickOnCellOf(movie: MovieDTO)
}
