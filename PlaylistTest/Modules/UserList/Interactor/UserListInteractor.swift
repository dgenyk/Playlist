//
//  UserListInteractor.swift
//  PlaylistTest
//
//  Created by Dmytro Genyk on 5/7/19.
//  Copyright © 2019 Dmytro Genyk. All rights reserved.
//

import Foundation

class UserListInteractor: UserListInteractorInputProtocol {
    var presenter: UserListInteractorOutputProtocol?
    var dataManager: UserListDataManagerInputProtocol?
    let autoRefreshInterval: TimeInterval = 10
    var secondsLeft: TimeInterval!
    
    var autoRefreshTimer: Timer? {
        willSet { autoRefreshTimer?.invalidate() }
    }
    
    func retrieveUsers() {
        autoRefreshTimer?.invalidate()
        dataManager?.retrieveUsers()
    }
    
    fileprivate func setupAutoRefreshTimer() {
        secondsLeft = autoRefreshInterval
        autoRefreshTimer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { [weak self] _ in
            guard let self = self else { return }
            self.secondsLeft -= 1
            self.refreshTimerUpdated(self.secondsLeft)
            if self.secondsLeft <= 0 {
                self.refreshTimerUpdated(self.autoRefreshInterval)
                self.retrieveUsers()
            }
        })
    }
}

extension UserListInteractor: UserListDataManagerOutputProtocol {
    func onUserListRetrieved(_ users: [UserItem]) {
        presenter?.didRetrieveUsers(users)
        setupAutoRefreshTimer()
    }
    
    func refreshTimerUpdated(_ left: Double) {
        presenter?.refreshTimerUpdated(left)
    }
    
    func onError() {
        presenter?.onError()
    }
    
}
