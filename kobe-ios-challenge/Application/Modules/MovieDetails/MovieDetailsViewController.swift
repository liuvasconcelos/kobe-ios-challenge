//
//  MovieDetailsViewController.swift
//  kobe-ios-challenge
//
//  Created by Livia Vasconcelos on 19/10/19.
//

import UIKit

class MovieDetailsViewController: UIViewController {
    
    var movie: MovieDTO?
    
    let imageProporcion: CGFloat = 92.5 / 139
        
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = false
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.view.backgroundColor = .darkMode
        
        self.addBlurBackground()
        self.addMovieImage()
        
        let imageHeight = (UIScreen.main.bounds.height / 2) - 64
        var genresList  = String()
        
        for (index, genre) in (movie?.genres ?? []).enumerated() {
            if index == 0 { genresList += "\(genre)" }
            else { genresList += ", \(genre)" }
        }
        
        self.addALabel(distanceToTop: imageHeight + 64, height: 50, text: movie?.title ?? String(),
                       size: 20, weight: .bold, color: .white)
        self.addALabel(distanceToTop: imageHeight + 114, height: 20, text: genresList,
                       size: 14, weight: .semibold, color: .lightGray)
        self.addALabel(distanceToTop: imageHeight + 134, height: 20, text: movie?.releaseDate ?? String(),
                       size: 14, weight: .semibold, color: .lightGray)
        self.addALabel(distanceToTop: imageHeight + 154, distanceToBottom: 16, text: movie?.overview ?? String(),
                       size: 12, weight: .regular, color: .lightGray)
       
    }
    
    fileprivate func addBlurBackground() {
        let backgroundImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        
        self.view.addSubview(backgroundImageView)
        backgroundImageView.fillSuperView()
        backgroundImageView.image = backgroundImageView.getImageViewImage(movie?.imagePath ?? String())
                
        let blurEffect = UIBlurEffect(style: UIBlurEffect.Style.dark)
        let blurEffectView = UIVisualEffectView(effect: blurEffect)
        blurEffectView.frame = view.bounds
        blurEffectView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        self.view.addSubview(blurEffectView)
    }
    
    fileprivate func addMovieImage() {
        let movieImage  = UIImageView(frame: CGRect(x: 0, y: 0, width: self.view.frame.width, height: self.view.frame.height))
        let imageHeight = (UIScreen.main.bounds.height / 2) - 64
        let imageWidth  = imageHeight * imageProporcion
        
        self.view.addSubview(movieImage)
        movieImage.anchor(top:     self.view.topAnchor,
                          padding: UIEdgeInsets(top: 64, left: 0, bottom: 0, right: 0),
                          size:    CGSize(width: imageWidth, height: imageHeight))
        movieImage.anchorCenterX(anchorX: self.view.centerXAnchor)
        
        let loader   = UIActivityIndicatorView()
        loader.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        loader.hidesWhenStopped = true
        movieImage.addSubview(loader)
        loader.fillSuperView()
        
        movieImage.showRoundedImageWith(path: movie?.imagePath ?? String(),
                                        radius: 4,
                                        activityIndicator: loader)
    }
    
    fileprivate func addALabel(distanceToTop: CGFloat, distanceToBottom: CGFloat? = nil, height: CGFloat? = nil, text: String,
                               size: CGFloat, weight: UIFont.Weight, color: UIColor,
                               numberOfLines: Int = 20) {
        let labelsFrames = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 30)
        let label        = UILabel(frame: labelsFrames)
        
        self.view.addSubview(label)
        label.anchor(top:      self.view.topAnchor,
                     leading:  self.view.leadingAnchor,
                     bottom:   distanceToBottom != nil ? self.view.bottomAnchor : nil,
                     trailing: self.view.trailingAnchor,
                     padding:  UIEdgeInsets(top: distanceToTop, left:  16, bottom: 0, right: 16),
                     size:     CGSize(width: 0, height: height != nil ? height! : 0))
        label.configure(text: text, alignment: .center, size: size, weight: weight, color: color)
        label.numberOfLines = numberOfLines
        label.contentMode   = .topLeft
        
    }
    

}
