//
//  TopRatedMoviesViewController.swift
//  kobe-ios-challenge
//
//  Created by Livia Vasconcelos on 18/10/19.
//

import UIKit

class TopRatedMoviesViewController: UIViewController, TopRatedMoviesViewContract {
    
    var tableView: MoviesTableView?
    
    private let activityIndicator = UIActivityIndicatorView()
    
    lazy var presenter: TopRatedMoviedPresenterContract = {
        return TopRatedMoviesPresenter(view: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = .blue
        
        self.addTableView()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        loadMovies(query: String())
    }
    
    fileprivate func addTableView() {
        tableView = MoviesTableView(frame: CGRect(x:      0,
                                                  y:      0,
                                                  width:  self.view.frame.width,
                                                  height: self.view.frame.height))
        
        guard let tableView = tableView else { return }
    
        tableView.searchController.searchResultsUpdater                 = self
        tableView.searchController.obscuresBackgroundDuringPresentation = false
        tableView.searchController.searchBar.placeholder                = AppStrings.searchByName
        tableView.separatorStyle                                        = .none
        
        navigationItem.searchController = tableView.searchController
        definesPresentationContext      = true
        
        self.view.addSubview(tableView)
        tableView.anchor(top:      self.view.topAnchor,
                         leading:  self.view.leadingAnchor,
                         bottom:   self.view.bottomAnchor,
                         trailing: self.view.trailingAnchor,
                         padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
    }
    
    func loadMovies(query: String, page: Int = 1) {
        tableView?.loader.startAnimating()
        presenter.findMovies(query: query, page: page)
    }
    
    func showErrorMessage() {
        let alert = UIAlertController(title: AppStrings.errorTitle,
                                      message: AppStrings.errorMessage,
                                      preferredStyle: .alert)
        let okButton = UIAlertAction(title: AppStrings.ok, style: .cancel) { (_) in
            self.loadMovies(query: String())
        }
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showMovies(_ movies: [MovieDTO]) {
        guard let tableView = tableView else { return }
        tableView.set(movies: movies)
    }
    
}
