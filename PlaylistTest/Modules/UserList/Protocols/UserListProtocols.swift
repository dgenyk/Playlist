//
//  UserListProtocols.swift
//  PlaylistTest
//
//  Created by Dmytro Genyk on 5/7/19.
//  Copyright © 2019 Dmytro Genyk. All rights reserved.
//

import UIKit

// PRESENTER -> VIEW
protocol UserListViewProtocol: ViewProtocol {
    var presenter: UserListPresenterProtocol? { get set }
    
    func refreshTimerUpdated(_ left: Double)
    func show(users: [UserItem])
}

// PRESENTER -> ROUTER
protocol UserListRouterProtocol: RouterProtocol {}

// VIEW -> PRESENTER
protocol UserListPresenterProtocol: class {
    var view: UserListViewProtocol? { get set }
    var interactor: UserListInteractorInputProtocol? { get set }
    var router: UserListRouterProtocol? { get set }
    
    func viewDidLoad()
    func loadUsers()
}

// INTERACTOR -> PRESENTER
protocol UserListInteractorOutputProtocol: ErrorHandlerProtocol {
    func didRetrieveUsers(_ users: [UserItem])
    func refreshTimerUpdated(_ left: Double)
}

// PRESENTER -> INTERACTOR
protocol UserListInteractorInputProtocol: class {
    var presenter: UserListInteractorOutputProtocol? { get set }
    var dataManager: UserListDataManagerInputProtocol? { get set }
    
    func retrieveUsers()
}

// INTERACTOR -> REMOTEDATAMANAGER
protocol UserListDataManagerInputProtocol: class {
    var remoteRequestHandler: UserListDataManagerOutputProtocol? { get set }
    
    func retrieveUsers()
}

// DATAMANAGER -> INTERACTOR
protocol UserListDataManagerOutputProtocol: ErrorHandlerProtocol {
    func onUserListRetrieved(_ users: [UserItem])
}
