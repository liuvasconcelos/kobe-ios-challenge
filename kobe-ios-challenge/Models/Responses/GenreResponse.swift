//
//  GenreResponse.swift
//  kobe-ios-challenge
//
//  Created by Livia Vasconcelos on 18/10/19.
//

import Foundation

struct GenreResponse: Codable {
    
    let genres: [Genre]?
    
}

struct Genre: Codable {
    
    let id:   Int?
    let name: String?
    
}
