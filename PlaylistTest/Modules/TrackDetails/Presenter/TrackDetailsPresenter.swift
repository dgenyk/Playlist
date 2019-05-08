//
//  TrackDetailsPresenter.swift
//  PlaylistTest
//
//  Created by Dmytro Genyk on 5/6/19.
//  Copyright © 2019 Dmytro Genyk. All rights reserved.
//

import Foundation

class TrackDetailsPresenter: TrackDetailsPresenterProtocol {
    var view: TrackDetailsViewProtocol?
    var interactor: TrackDetailsInteractorInputProtocol?
    var router: TrackDetailsRouterProtocol?
    var trackID: String?
    
    func loadTrackDetails() {
        view?.showLoading()
        interactor?.retrieveTrackDetails(trackID!)
    }
}

extension TrackDetailsPresenter: TrackDetailsInteractorOutputProtocol {
    func didRetrieveTrackDetails(_ track: TrackItem) {
        view?.hideLoading()
        view?.show(track: track)
    }
    
    func onError() {
        view?.hideLoading()
        view?.showError()
    }
}
