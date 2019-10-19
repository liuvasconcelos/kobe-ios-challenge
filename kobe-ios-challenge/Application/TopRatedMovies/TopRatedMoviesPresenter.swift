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
    
    func getAllMovies() {
        getGenre.getAllGenres { (callback) in
            callback.onSuccess { (response) in
                self.genres = response.genres ?? []
                self.findMovies(query: String(), page: 1)
            }
            
            callback.onFailed { (_) in
                self.view.showErrorMessage()
            }
        }
    }
    
    func findMovies(query: String, page: Int) {
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
                                       image:       self.getImageFrom(path: $0.posterPath ?? $0.backdropPath ?? String()),
                                       genres:      self.mapGenresFrom(ids: $0.genreIds ?? []),
                                       releaseDate: $0.releaseDate?.getDate() ?? Date(),
                                       overview:    $0.overview ?? String())
        }
    }
    
    fileprivate func getImageFrom(path: String) -> UIImage {
        let completePath = "http://image.tmdb.org/t/p/w185//\(path)"
        guard let url  = NSURL(string: completePath) else { return UIImage() }
        guard let data = NSData(contentsOf: url as URL) else { return UIImage() }
        
        return UIImage(data: data as Data) ?? UIImage()
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
