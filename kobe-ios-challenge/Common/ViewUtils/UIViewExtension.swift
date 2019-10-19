//
//  UIViewExtension.swift
//  kobe-ios-challenge
//
//  Created by Livia Vasconcelos on 19/10/19.
//

import UIKit

extension UIView {
    public static func identifier() -> String {
        return "\(String(describing: self.self))Identifier"
    }
}
