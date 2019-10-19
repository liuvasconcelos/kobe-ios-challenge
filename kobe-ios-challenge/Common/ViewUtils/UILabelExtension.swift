//
//  UILabelExtension.swift
//  kobe-ios-challenge
//
//  Created by Livia Vasconcelos on 19/10/19.
//

import UIKit

extension UILabel {
    
    func configure(text: String, alignment: NSTextAlignment = .left, size: CGFloat, weight: UIFont.Weight, color: UIColor) {
        self.text          = text
        self.textAlignment = alignment
        self.font          = .systemFont(ofSize: size, weight: weight)
        self.textColor     = color
    }
    
}
