//
//  StringExtension.swift
//  kobe-ios-challenge
//
//  Created by Livia Vasconcelos on 18/10/19.
//

import Foundation

extension String {
    func getDate() -> Date {
        let dateFormatter = DateFormatter()
        //LOCALIZAR!
        dateFormatter.dateFormat = "yyyy-MM-dd"
        return dateFormatter.date(from: self) ?? Date()
    }
}
