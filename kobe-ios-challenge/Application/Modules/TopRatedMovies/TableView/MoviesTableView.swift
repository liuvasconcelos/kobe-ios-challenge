//
//  MoviesTableView.swift
//  kobe-ios-challenge
//
//  Created by Livia Vasconcelos on 19/10/19.
//

import UIKit

class MoviesTableView: UITableView, UITableViewDataSource, UITableViewDelegate {
    
    let searchController = UISearchController(searchResultsController: nil)
    let loader           = UIActivityIndicatorView()
    let refresh          = UIRefreshControl()
    
    private var filteredMovies   = [MovieDTO]() {
        didSet {
            DispatchQueue.main.async {
                self.reloadData()
            }
        }
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
        
        self.addLoader()
        self.addSubview(refresh)
    }
    
    fileprivate func addLoader() {
        loader.center           = CGPoint(x: UIScreen.main.bounds.width / 2,
                                          y: 120)
        loader.hidesWhenStopped = true
        loader.style            = UIActivityIndicatorView.Style.gray
        
        self.addSubview(loader)
    }
    
    func set(movies: [MovieDTO]) {
        DispatchQueue.main.async {
            self.loader.stopAnimating()
            self.refresh.endRefreshing()
            self.movies          = movies
            self.delegate        = self
            self.dataSource      = self
            self.separatorStyle  = .none
           
            self.register(MovieCell.self, forCellReuseIdentifier: MovieCell.identifier())
        }
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
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // ir para outra tela
    }

}
