//
//  TopRatedMoviesViewController.swift
//  kobe-ios-challenge
//
//  Created by Livia Vasconcelos on 18/10/19.
//

import UIKit

class TopRatedMoviesViewController: UIViewController, TopRatedMoviesViewContract, MovieCellViewContract {

    var tableView: MoviesTableView?
        
    lazy var presenter: TopRatedMoviedPresenterContract = {
        return TopRatedMoviesPresenter(view: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.addTableView()
    }
    
    deinit {
        tableView = nil
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.prefersLargeTitles = true
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
        configureTableView()
        configureTableViewRefreshControl()
        self.view.addSubview(tableView)
        tableView.anchor(top:      self.view.topAnchor,
                         leading:  self.view.leadingAnchor,
                         bottom:   self.view.bottomAnchor,
                         trailing: self.view.trailingAnchor,
                         padding: UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0))
    }
    
    fileprivate func configureTableView() {
        guard let tableView = tableView else { return }
    
        tableView.searchController.searchResultsUpdater                 = self
        tableView.searchController.obscuresBackgroundDuringPresentation = false
        tableView.searchController.searchBar.placeholder                = AppStrings.searchByName
        tableView.separatorStyle                                        = .none
        tableView.allowsMultipleSelection                               = false
        tableView.cellContract                                          = self
        
        navigationItem.searchController = tableView.searchController
        definesPresentationContext      = true
    }
    
    fileprivate func configureTableViewRefreshControl() {
        guard let tableView = tableView else { return }
        
        tableView.refresh.tintColor = .gray
        tableView.refresh.addTarget(self, action: #selector(reloadTableView), for: .valueChanged)
    }
    
    @objc func reloadTableView() {
        self.loadMovies()
    }
    
    func loadMovies(query: String = String(), page: Int = 1) {
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
    
    func didClickOnCellOf(movie: MovieDTO) {
        let detailsView   = MovieDetailsViewController()
        detailsView.movie = movie
    
        if #available(iOS 13.0, *) {
            self.present(detailsView, animated: true, completion: nil)
        } else  {
            self.navigationController?.pushViewController(detailsView, animated: true)
        }
        
    }
    
}
