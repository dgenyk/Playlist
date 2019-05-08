//
//  UserListPresenter.swift
//  PlaylistTest
//
//  Created by Dmytro Genyk on 5/7/19.
//  Copyright © 2019 Dmytro Genyk. All rights reserved.
//

import Foundation

class UserListPresenter: UserListPresenterProtocol {
    
    var view: UserListViewProtocol?
    var interactor: UserListInteractorInputProtocol?
    var router: UserListRouterProtocol?
    
    func viewDidLoad() {
        view?.showLoading()
        loadUsers()
    }
    
    func loadUsers() {
        interactor?.retrieveUsers()
    }
}

extension UserListPresenter: UserListInteractorOutputProtocol {
    func refreshTimerUpdated(_ left: Double) {
        view?.refreshTimerUpdated(left)
    }
    
    func didRetrieveUsers(_ users: [UserItem]) {
        view?.hideLoading()
        view?.show(users: users)
    }
    
    func onError() {
        view?.hideLoading()
        view?.showError()
    }
}
