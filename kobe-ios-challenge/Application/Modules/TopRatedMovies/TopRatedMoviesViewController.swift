//
//  TopRatedMoviesViewController.swift
//  kobe-ios-challenge
//
//  Created by Livia Vasconcelos on 18/10/19.
//

import UIKit

class TopRatedMoviesViewController: UIViewController, TopRatedMoviesViewContract {
    
    var tableView: MoviesTableView?
    
    lazy var presenter: TopRatedMoviedPresenterContract = {
        return TopRatedMoviesPresenter(view: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadMovies()
        self.addTableView()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = .blue
    }
    
    fileprivate func loadMovies() {
        presenter.getAllMovies()
    }
    
    fileprivate func addTableView() {
        tableView = MoviesTableView(frame: CGRect(x:      0,
                                                  y:      0,
                                                  width:  self.view.frame.width,
                                                  height: self.view.frame.height))
        guard let tableView = tableView else { return }
        self.view.addSubview(tableView)
        tableView.anchor(top:      self.view.topAnchor,
                         leading:  self.view.leadingAnchor,
                         bottom:   self.view.bottomAnchor,
                         trailing: self.view.trailingAnchor,
                         padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
    
        tableView.searchController.searchResultsUpdater = self
        tableView.searchController.obscuresBackgroundDuringPresentation = false
        tableView.searchController.searchBar.placeholder = "Search by name"
//        tableView.contract = self
        
        navigationItem.searchController = tableView.searchController
        definesPresentationContext = true
    }
    
    func showErrorMessage() {
        let alert = UIAlertController(title: AppStrings.errorTitle,
                                      message: AppStrings.errorMessage,
                                      preferredStyle: .alert)
        let okButton = UIAlertAction(title: AppStrings.ok, style: .cancel) { (_) in
            self.loadMovies()
        }
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showMovies(_ movies: [MovieDTO]) {
        guard let tableView = tableView else { return }
        tableView.set(movies: movies)
    }
    
}
