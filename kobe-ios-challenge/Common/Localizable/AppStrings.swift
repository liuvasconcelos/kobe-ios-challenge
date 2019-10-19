//
//  AppStrings.swift
//  kobe-ios-challenge
//
//  Created by Livia Vasconcelos on 18/10/19.
//

import Foundation

public class AppStrings {
    public static let appLanguage  = localized("app_language")
    public static let ok           = localized("ok")
    public static let errorTitle   = localized("error_title")
    public static let errorMessage = localized("error_message")
    
    public static func localized(_ value: String) -> String {
        return NSLocalizedString(value, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}

