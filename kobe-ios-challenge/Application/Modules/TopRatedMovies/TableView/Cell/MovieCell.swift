//
//  MovieCell.swift
//  kobe-ios-challenge
//
//  Created by Livia Vasconcelos on 19/10/19.
//

import UIKit

class MovieCell: UITableViewCell {
    
    public static let cellHeight: CGFloat = 187
    
    var mainView:    UIView?
    var movieImage:  UIImageView?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func configureCellFor(movie: MovieDTO) {
        self.removeSubviews()
        
        self.backgroundColor = .darkMode
        
        self.addMainView()
        self.addMovieImage(imagePath: movie.imagePath)
        self.addLabels(title:       movie.title,
                       genres:      movie.genres,
                       releaseDate: movie.releaseDate)
    }
    
    fileprivate func addMainView() {
        mainView = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: MovieCell.cellHeight))
        
        guard let mainView = mainView else { return }
        self.addSubview(mainView)
        mainView.anchor(top:      self.topAnchor,
                        leading:  self.leadingAnchor,
                        bottom:   self.bottomAnchor,
                        trailing: self.trailingAnchor,
                        padding:  UIEdgeInsets(top: 0, left: 0, bottom: 16, right: 0))
        mainView.backgroundColor = .veryDarkGray
        self.addTopAndBottomDetail()
    }
    
    fileprivate func addTopAndBottomDetail() {
        let topBorder    = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 0.2))
        let bottomBorder = UIView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: 0.2))
        
        topBorder.backgroundColor    = .gray
        bottomBorder.backgroundColor = .gray
        
        guard let mainView = mainView else { return }
        mainView.addSubviews(topBorder, bottomBorder)
        topBorder.anchor(top:      mainView.topAnchor,
                         leading:  mainView.leadingAnchor,
                         trailing: mainView.trailingAnchor,
                         padding:  UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                         size:     CGSize(width: 0, height: 0.5))
        bottomBorder.anchor(leading:  mainView.leadingAnchor,
                            bottom:   mainView.bottomAnchor,
                            trailing: mainView.trailingAnchor,
                            padding:  UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0),
                            size:     CGSize(width: 0, height: 0.5))
    }
    
    fileprivate func addMovieImage(imagePath: String) {
        movieImage = UIImageView(frame: CGRect(x: 0, y: 0, width: self.frame.width, height: self.frame.height))
        
        guard let mainView = mainView, let movieImage = movieImage else { return }
        
        mainView.addSubview(movieImage)
        movieImage.anchor(top:     mainView.topAnchor,
                          leading: mainView.leadingAnchor,
                          padding: UIEdgeInsets(top: 16, left: 16, bottom: 0, right: 0),
                          size:    CGSize(width: 92.5, height: 139) )
        
        let loader   = UIActivityIndicatorView()
        loader.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        loader.hidesWhenStopped = true
        movieImage.addSubview(loader)
        loader.fillSuperView()
        
        movieImage.showRoundedImageWith(path: imagePath, radius: 8, activityIndicator: loader)
    }
    
    fileprivate func addLabels(title: String, genres: [String], releaseDate: String) {
        var genresList = String()
        
        for (index, genre) in genres.enumerated() {
            if index == 0 { genresList += "\(genre)" }
            else { genresList += ", \(genre)" }
        }
        
        self.addALabel(distanceToTop: 16, height: 60, text: title, size: 20, weight: .bold, color: .white, numberOfLines: 2)
        self.addALabel(distanceToTop: 95, text: genresList, size: 16, weight: .regular, color: .lightGray)
        self.addALabel(distanceToTop: 125, text: releaseDate, size: 16, weight: .regular, color: .lightGray)
    }
    
    fileprivate func addALabel(distanceToTop: CGFloat, height: CGFloat = 30, text: String,
                               size: CGFloat, weight: UIFont.Weight, color: UIColor, numberOfLines: Int = 1) {
        let labelsFrames = CGRect(x: 0, y: 0, width: self.frame.width, height: 30)
        let label        = UILabel(frame: labelsFrames)
        
        guard let mainView = mainView else { return }
        mainView.addSubview(label)
        label.anchor(top:      mainView.topAnchor,
                     leading:  mainView.leadingAnchor,
                     trailing: mainView.trailingAnchor,
                     padding:  UIEdgeInsets(top: distanceToTop, left:  125, bottom: 0, right: 16),
                     size:     CGSize(width: 0, height: height))
        label.configure(text: text, size: size, weight: weight, color: color)
        label.numberOfLines = numberOfLines
        label.lineBreakMode = .byTruncatingTail
        label.contentMode   = .topLeft
    }
}
