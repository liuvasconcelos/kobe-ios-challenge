//
//  MovieDetailsViewController.swift
//  kobe-ios-challenge
//
//  Created by Livia Vasconcelos on 19/10/19.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    var movie: MovieDTO?
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = .white
        
        let label = UILabel(frame: CGRect(x: 0, y: 150, width: self.view.frame.width, height: 100))
        self.view.addSubview(label)
        
        label.text = movie?.title ?? "OI"
    }
    

}
