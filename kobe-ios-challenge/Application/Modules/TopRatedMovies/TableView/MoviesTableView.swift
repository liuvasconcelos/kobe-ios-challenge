//
//  MoviesTableView.swift
//  kobe-ios-challenge
//
//  Created by Livia Vasconcelos on 19/10/19.
//

import UIKit

class MoviesTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    let searchController = UISearchController(searchResultsController: nil)
    
    private var filteredMovies   = [MovieDTO]() {
        didSet { self.reloadData() }
    }
    
    private var movies   = [MovieDTO]() {
        didSet {
            self.filteredMovies = self.movies
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    public override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
    }
    
    func set(movies: [MovieDTO]) {
        self.movies          = movies
        self.delegate        = self
        self.dataSource      = self
        self.separatorStyle  = .singleLine
        
        self.register(MovieCell.self, forCellReuseIdentifier: MovieCell.identifier())
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return filteredMovies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: MovieCell.identifier(), for: indexPath) as? MovieCell else {
            return UITableViewCell()
        }
        
        cell.configureCellFor(movie: filteredMovies[indexPath.row])

        return cell
    }
    

}
