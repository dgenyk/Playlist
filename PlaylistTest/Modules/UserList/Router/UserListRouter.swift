//
//  UserRouter.swift
//  PlaylistTest
//
//  Created by Dmytro Genyk on 5/5/19.
//  Copyright © 2019 Dmytro Genyk. All rights reserved.
//

import UIKit

class UserListRouter: UserListRouterProtocol {
    static func createModule() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let view = storyboard.instantiateViewController(withIdentifier: "UserList") as? UserListViewController else {
            fatalError("wrong view controller for UserListViewController")
        }
        let presenter = UserListPresenter()
        let router = UserListRouter()
        let interactor = UserListInteractor()
        let dataManager = UserListDataManager()
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.dataManager = dataManager
        dataManager.remoteRequestHandler = interactor
        
        return view
    }
}
