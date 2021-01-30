//
//  AppDelegate.swift
//  TennisScore
//
//  Created by Ananth Bhamidipati on 30/01/2021.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window:UIWindow?
    private var navigationController: UINavigationController?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let tennisScoreViewModel = TennisScoreViewModel()
        let tennisScoreViewController = TennisScoreViewController(viewModel: tennisScoreViewModel)
        navigationController = UINavigationController(rootViewController: tennisScoreViewController)
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = navigationController
        window?.makeKeyAndVisible()
        
        return true
    }

}

