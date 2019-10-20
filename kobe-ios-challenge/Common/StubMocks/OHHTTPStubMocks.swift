//
//  OHHTTPStubMocks.swift
//  kobe-ios-challenge
//
//  Created by Livia Vasconcelos on 19/10/19.
//

import OHHTTPStubs
import UIKit

public class OHHTTPStubMocks {
    public static func configureMocks() {
        self.searchForTopRatedMovies()
        self.searchForGenres()
    }
    
    static func searchForTopRatedMovies() {
        OHHTTPStubs.stubRequests(passingTest: { request -> Bool in
            let url = "https://api.themoviedb.org/3/movie/top_rated?api_key=c5850ed73901b8d268d0898a8a9d8bff&page=1&language=en-US"
            return request.url?.absoluteString == url
        }, withStubResponse: { _ -> OHHTTPStubsResponse in
            if isErrorTest() {
                return OHHTTPStubsResponse(fileAtPath: OHPathForFile("errorResponse.json", self)!, statusCode: 200, headers: nil)
            } else {
                return OHHTTPStubsResponse(fileAtPath: OHPathForFile("topRated.json", self)!, statusCode: 200, headers: nil)
            }
        })
        
        OHHTTPStubs.stubRequests(passingTest: { request -> Bool in
            let pageOneURL = "https://api.themoviedb.org/3/movie/top_rated?api_key=c5850ed73901b8d268d0898a8a9d8bff&page=1&language=en-US"
            let baseURL    = "https://api.themoviedb.org/3/movie/top_rated?api_key=c5850ed73901b8d268d0898a8a9d8bff&page="
            
            let isNotFirstPage = request.url!.absoluteString.contains(baseURL) && request.url?.absoluteString != pageOneURL
            return isNotFirstPage
        }, withStubResponse: { _ -> OHHTTPStubsResponse in
            return OHHTTPStubsResponse(fileAtPath: OHPathForFile("emptyResponse.json", self)!, statusCode: 200, headers: nil)
        })
    }
    
    static func searchForGenres() {
        OHHTTPStubs.stubRequests(passingTest: { request -> Bool in
            let url = "https://api.themoviedb.org/3/genre/movie/list?api_key=c5850ed73901b8d268d0898a8a9d8bff&language=en-US"
            return request.url?.absoluteString == url
        }, withStubResponse: { _ -> OHHTTPStubsResponse in
            return OHHTTPStubsResponse(fileAtPath: OHPathForFile("genres.json", self)!, statusCode: 200, headers: nil)
        })
    }
    
    static func isErrorTest() -> Bool {
        let environment = ProcessInfo().environment
        return environment["ERRORTEST"] == "YES"
    }
    
}

