//
//  MoviesTableViewExtension.swift
//  kobe-ios-challenge
//
//  Created by Livia Vasconcelos on 19/10/19.
//

extension MoviesTableView {
    
    func searchBarIsEmpty() -> Bool {
        return self.searchController.searchBar.text?.isEmpty ?? true
    }
    
//    func isFiltering() -> Bool {
//        return self.searchController.isActive && !searchBarIsEmpty()
//    }
    
}
