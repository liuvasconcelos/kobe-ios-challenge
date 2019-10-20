//
//  MovieEntry.swift
//  kobe-ios-challenge
//
//  Created by Livia Vasconcelos on 18/10/19.
//

import Foundation

struct TopRatedResponse: Codable {
    let movies: [MovieResponse]?
    
    enum CodingKeys: String, CodingKey {
        case movies = "results"
    }
}

struct MovieResponse: Codable {
    
    let id:           Int?
    let title:        String?
    let posterPath:   String?
    let backdropPath: String?
    let genreIds:     [Int]?
    let releaseDate:  String?
    let overview:     String?
    
    enum CodingKeys: String, CodingKey {
        case id, title, overview
        case posterPath   = "poster_path"
        case backdropPath = "backdrop_path"
        case genreIds     = "genre_ids"
        case releaseDate  = "release_date"
    }
}
