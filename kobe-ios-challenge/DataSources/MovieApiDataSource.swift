//
//  MovieApiDataSource.swift
//  kobe-ios-challenge
//
//  Created by Livia Vasconcelos on 18/10/19.
//

import Foundation

protocol MovieApiDataSource {
    
    func getAllGenres(_ loadCallback: @escaping (BaseCallback<GenreResponse>) -> Void)
    func findMovies(query: String, page: Int, _ loadCallback: @escaping (BaseCallback<TopRatedResponse>) -> Void)
}
