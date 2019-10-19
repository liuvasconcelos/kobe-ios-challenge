//
//  MovieCell.swift
//  kobe-ios-challenge
//
//  Created by Livia Vasconcelos on 19/10/19.
//

import UIKit

class MovieCell: UITableViewCell {
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configureCellFor(movie: MovieDTO) {
        self.backgroundColor = .black
        
        self.textLabel?.textColor = .white
        self.textLabel?.text = movie.title
    }
    
//TO BE USED ON CELL!
    fileprivate func getImageFrom(path: String) -> UIImage {
        guard let url  = NSURL(string: path) else { return UIImage() }
        guard let data = NSData(contentsOf: url as URL) else { return UIImage() }
       
        return UIImage(data: data as Data) ?? UIImage()
    }
}
