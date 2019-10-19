//
//  TopRatedMoviesPresenter.swift
//  kobe-ios-challenge
//
//  Created by Livia Vasconcelos on 18/10/19.
//

import UIKit

class TopRatedMoviesPresenter: TopRatedMoviedPresenterContract {
    
    private let view:     TopRatedMoviesViewContract
    private let getGenre: GetGenre
    private let getMovie: GetMovie
    
    private var genres = [Genre]()
    
    init(view: TopRatedMoviesViewContract) {
        self.view = view
        self.getGenre = GetGenre(apiDataSource: MovieApiDataSourceImpl.getInstance())
        self.getMovie = GetMovie(apiDataSource: MovieApiDataSourceImpl.getInstance())
    }
    
    func findMovies(query: String, page: Int) {
        self.getGenres(query: query, page: page)
    }
    
    fileprivate func getGenres(query: String, page: Int) {
        getGenre.getAllGenres { (callback) in
            callback.onSuccess { (response) in
                self.genres.removeAll()
                self.genres = response.genres ?? []
                self.getMovies(query: query, page: page)
            }
            
            callback.onFailed { (_) in
                self.view.showErrorMessage()
            }
        }
    }
    
    fileprivate func getMovies(query: String, page: Int) {
        getMovie.findMovies(query: query, page: page) { (callback) in
            callback.onSuccess { (response) in
                self.view.showMovies(self.mapMoviesDtos(response.movies ?? []))
            }
            
            callback.onFailed { (_) in
                self.view.showErrorMessage()
            }
        }
    }
    
    fileprivate func mapMoviesDtos(_ response: [MovieResponse]) -> [MovieDTO] {
        return response.map { MovieDTO(id:          $0.id ?? Int(),
                                       title:       $0.title ?? String(),
                                       imagePath:   self.getCompleteImagePath(path: $0.posterPath ?? $0.backdropPath ?? String()),
                                       genres:      self.mapGenresFrom(ids: $0.genreIds ?? []),
                                       releaseDate: $0.releaseDate?.getDate() ?? Date(),
                                       overview:    $0.overview ?? String())
        }
    }
    
    fileprivate func getCompleteImagePath(path: String) -> String {
        return "http://image.tmdb.org/t/p/w185//\(path)"
    }
    
    fileprivate func mapGenresFrom(ids: [Int]) -> [String] {
        var genresNames = [String]()
        
        for idGenre in ids {
            let currentGenre =  genres.filter { (genre) -> Bool in
                genre.id == idGenre
            }
            
            if let genreName = currentGenre.first?.name {
                genresNames.append(genreName)
            }
        }
        
        return genresNames
    }
    
}
