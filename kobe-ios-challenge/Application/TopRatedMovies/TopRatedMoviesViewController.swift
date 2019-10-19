//
//  TopRatedMoviesViewController.swift
//  kobe-ios-challenge
//
//  Created by Livia Vasconcelos on 18/10/19.
//

import UIKit

class TopRatedMoviesViewController: UIViewController, TopRatedMoviesViewContract {
    
    lazy var presenter: TopRatedMoviedPresenterContract = {
        return TopRatedMoviesPresenter(view: self)
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.loadMovies()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = .blue
    }
    
    fileprivate func loadMovies() {
        presenter.getAllMovies()
    }
    
    func showErrorMessage() {
        let alert = UIAlertController(title: "Error message",
                                      message: "Something happened, please try again later.",
                                      preferredStyle: .alert)
        let okButton = UIAlertAction(title: "Ok", style: .cancel) { (_) in
            self.loadMovies()
        }
        alert.addAction(okButton)
        self.present(alert, animated: true, completion: nil)
    }
    
    func showMovies(_ movies: [MovieDTO]) {
        let alert = UIAlertController(title: "Sucesso",
                                      message: "UHU!",
                                      preferredStyle: .alert)
        self.present(alert, animated: true, completion: nil)
    }
    
    //TO BE USED ON CELL!
    fileprivate func getImageFrom(path: String) -> UIImage {
        guard let url  = NSURL(string: path) else { return UIImage() }
        guard let data = NSData(contentsOf: url as URL) else { return UIImage() }
        
        return UIImage(data: data as Data) ?? UIImage()
    }
}
