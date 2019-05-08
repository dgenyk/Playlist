//
//  Router.swift
//  PlaylistTest
//
//  Created by Dmytro Genyk on 5/5/19.
//  Copyright © 2019 Dmytro Genyk. All rights reserved.
//

import UIKit

protocol PresenterProtocol: class {
    static func createModule() -> UIViewController
}

class Router: PresenterProtocol {
    static func createModule() -> UIViewController {
        let view = TabBarViewController()
        let trackController = TrackListRouter.createModule()
        trackController.tabBarItem = UITabBarItem(title: "Tracks", image: #imageLiteral(resourceName: "trackIcon"), tag: 0)
        let userViewController = UserListRouter.createModule()
        
        userViewController.tabBarItem = UITabBarItem(tabBarSystemItem: .topRated, tag: 1)
        view.viewControllers = [trackController, userViewController]
        return view
    }
}
