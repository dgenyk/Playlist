//
//  AppDelegate.swift
//  PlaylistTest
//
//  Created by Dmytro Genyk on 5/5/19.
//  Copyright © 2019 Dmytro Genyk. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        guard let tabBarController: TabBarViewController = Router.createModule() as? TabBarViewController else {
            return false
        }

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        
        return true
    }
}

