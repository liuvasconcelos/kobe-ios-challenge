//
//  UIImageViewExtension.swift
//  kobe-ios-challenge
//
//  Created by Livia Vasconcelos on 19/10/19.
//

import UIKit

extension UIImageView {
    func showRoundedImageWith(path imagePath: String, radius: CGFloat = 8, activityIndicator: UIActivityIndicatorView = UIActivityIndicatorView()) {
        self.layer.cornerRadius  = radius
        self.layer.masksToBounds = true
        
        self.showImageWith(path: imagePath, activityIndicator: activityIndicator)
    }
    
    func showImageWith(path imagePath: String, activityIndicator: UIActivityIndicatorView) {
        activityIndicator.startAnimating()
        DispatchQueue.global(qos: .background).async {
            let imageViewImage = self.getImageViewImage(imagePath)
            
            DispatchQueue.main.sync {
                self.image = imageViewImage
                activityIndicator.stopAnimating()
            }
        }
    }
    
    fileprivate func getImageViewImage(_ imagePath: String) -> UIImage {
        let imageViewImage = UIImage()
        
        if imagePath.isEmpty { return imageViewImage }
        guard let url = NSURL(string: imagePath) else { return imageViewImage}
        guard let data = NSData(contentsOf: url as URL) else { return imageViewImage}

        return UIImage(data: data as Data) ?? UIImage()
    }
}
