//
//  MovieApiDataSourceImpl.swift
//  kobe-ios-challenge
//
//  Created by Livia Vasconcelos on 18/10/19.
//

import Foundation

class MovieApiDataSourceImpl: MovieApiDataSource {
    
    private static var INSTANCE: MovieApiDataSourceImpl?
    
    private let apiKey             = "c5850ed73901b8d268d0898a8a9d8bff"
    private let languageCode       = AppStrings.appLanguage
    
    private let baseUrlForGenres   = "https://api.themoviedb.org/3/genre/movie/list?api_key="
    private let baseUrlForTopRated = "https://api.themoviedb.org/3/movie/top_rated?api_key="
    private let baseUrlForSearch   = "https://api.themoviedb.org/3/search/movie?api_key="
    
    public static func getInstance() -> MovieApiDataSourceImpl {
        return INSTANCE ?? MovieApiDataSourceImpl()
    }
    
    public static func destroyInstance() {
        INSTANCE = nil
    }
    
    func getAllGenres(_ loadCallback: @escaping (BaseCallback<GenreResponse>) -> Void) {
        let urlPath = "\(baseUrlForGenres)\(apiKey)&language=\(languageCode)"
        
        guard let url = URL(string: urlPath) else { return }
        
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
        let urlPath = self.getUrlForMovies(query: query, page: page)
        
        guard let url = URL(string: urlPath) else { return }
        URLSession.shared.dataTask(with: url) { (data, response, _) in
            guard let data = data else { return loadCallback(BaseCallback.failed()) }
            
             do {
                let decoder = JSONDecoder()
                let movies  = try decoder.decode(TopRatedResponse.self, from: data)
                
                loadCallback(BaseCallback.success(movies))
            
             } catch {
                 loadCallback(BaseCallback.failed())
          }
        }.resume()
    }
    
    fileprivate func getUrlForMovies(query: String, page: Int) -> String {
        var urlPath = "\(baseUrlForSearch)\(apiKey)&query=\(query)&page=\(page)&language=\(languageCode)"
        
        if query.isEmpty {
            urlPath = "\(baseUrlForTopRated)\(apiKey)&page=\(page)&language=\(languageCode)"
        }
        
        return urlPath
    }
    
    
}
