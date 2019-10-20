//
//  TopRatedMoviesViewControllerSearchBarExtension.swift
//  kobe-ios-challenge
//
//  Created by Livia Vasconcelos on 19/10/19.
//

import UIKit

extension TopRatedMoviesViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchController.searchBar.text ?? "")
    }
    
    func filterContentForSearchText(_ searchText: String, scope: String = "All") {
        self.currentSearchText = searchText
        tableView?.currentPage = 0
        tableView?.movies.removeAll()
        self.loadMovies()
    }
}
