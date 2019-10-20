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
}
