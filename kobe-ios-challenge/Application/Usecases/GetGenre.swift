//
//  GetGenre.swift
//  kobe-ios-challenge
//
//  Created by Livia Vasconcelos on 18/10/19.
//

import Foundation

class GetGenre {
    
    private let apiDataSource: MovieApiDataSource
    
    init(apiDataSource: MovieApiDataSource) {
        self.apiDataSource = apiDataSource
    }
    
    func getAllGenres(_ loadCallback: @escaping (BaseCallback<GenreResponse>) -> Void) {
        apiDataSource.getAllGenres(loadCallback)
    }
    
    func findMovies(query: String, page: Int, _ loadCallback: @escaping (BaseCallback<TopRatedResponse>) -> Void) {
        apiDataSource.findMovies(query: query, page: page, loadCallback)
    }
}
