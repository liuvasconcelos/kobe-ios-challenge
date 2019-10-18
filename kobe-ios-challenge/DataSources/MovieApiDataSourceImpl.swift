//
//  MovieApiDataSourceImpl.swift
//  kobe-ios-challenge
//
//  Created by Livia Vasconcelos on 18/10/19.
//

import Foundation

class MovieApiDataSourceImpl: MovieApiDataSource {
    
    private static var INSTANCE: MovieApiDataSourceImpl?
    
    public static func getInstance() -> MovieApiDataSourceImpl {
        return INSTANCE ?? MovieApiDataSourceImpl()
    }
    
    public static func destroyInstance() {
        INSTANCE = nil
    }
    
    func getAllGenres(_ loadCallback: @escaping (BaseCallback<GenreResponse>) -> Void) {
        guard let url = URL(string: "https://api.themoviedb.org/3/genre/movie/list?api_key=c5850ed73901b8d268d0898a8a9d8bff&language=pt-BR") else { return }
        URLSession.shared.dataTask(with: url) { (data, response, _) in
            guard let data = data else { return loadCallback(BaseCallback.failed()) }
            
             do {
                let decoder = JSONDecoder()
                let genres = try decoder.decode(GenreResponse.self, from: data)
                
                loadCallback(BaseCallback.success(genres))
                 
             } catch {
                 loadCallback(BaseCallback.failed())
          }
        }.resume()
    }
    
    func findMovies(query: String, page: Int, _ loadCallback: @escaping (BaseCallback<TopRatedResponse>) -> Void) {
        // g
    }
    
    
}
