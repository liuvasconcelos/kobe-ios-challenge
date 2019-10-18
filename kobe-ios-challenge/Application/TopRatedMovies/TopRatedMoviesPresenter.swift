//
//  TopRatedMoviesPresenter.swift
//  kobe-ios-challenge
//
//  Created by Livia Vasconcelos on 18/10/19.
//

import Foundation

class TopRatedMoviesPresenter: TopRatedMoviedPresenterContract {
    
    private let view:     TopRatedMoviesViewContract
    private let getGenre: GetGenre
    
    init(view: TopRatedMoviesViewContract) {
        self.view = view
        self.getGenre = GetGenre(apiDataSource: MovieApiDataSourceImpl.getInstance())
    }
    
    func getAllGenres() {
        getGenre.getAllGenres { (callback) in
            callback.onSuccess { (genres) in
                print("SUCESSO")
            }
            
            callback.onFailed { (_) in
                print("ERRO")
            }
        }
    }
    
    func findMovies(query: String, page: Int) {
        // todo
    }
    
}
