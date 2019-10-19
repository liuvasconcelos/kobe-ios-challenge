//
//  AppDelegate.swift
//  kobe-ios-challenge
//
//  Created by Lívia Vasconcelos on 14/10/19.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let mainView: TopRatedMoviesViewController = TopRatedMoviesViewController()
        
        let navigation = UINavigationController(rootViewController: mainView)
        navigation.navigationBar.topItem?.title                 = AppStrings.topRatedMovies
        navigation.navigationBar.prefersLargeTitles             = true
        navigation.navigationBar.topItem?.largeTitleDisplayMode = .automatic
        
        window                     = UIWindow(frame: UIScreen.main.bounds)
        window!.rootViewController = navigation
        window!.makeKeyAndVisible()
        
        return true
    }

    func applicationWillResignActive(_ application: UIApplication) { }

    func applicationDidEnterBackground(_ application: UIApplication) { }

    func applicationWillEnterForeground(_ application: UIApplication) { }

    func applicationDidBecomeActive(_ application: UIApplication) { }

    func applicationWillTerminate(_ application: UIApplication) { }


}

