//
//  TrackPresenter.swift
//  PlaylistTest
//
//  Created by Dmytro Genyk on 5/5/19.
//  Copyright © 2019 Dmytro Genyk. All rights reserved.
//

import Foundation

class TrackPresenter: TracksPresenterProtocol {
    var view: TrackViewProtocol?
    var interactor: TracksInteractorInputProtocol?
    var router: TracksRouterProtocol?
    var pageToShow = 1
    let pageLimit = 10
    
    func loadTracks() {
        view?.showLoading()
        interactor?.retrieveTrackList(page: pageToShow, pageLimit: pageLimit)
    }

    func showTrackDetail(forTrack postID: String) {
        router?.presentTrackDetailScreen(from: view!, forTrack: postID)
    }
}

extension TrackPresenter: TracksInteractorOutputProtocol {
    func didRetrieveTracks(_ tracks: [TrackItem]) {
        pageToShow += 1
        view?.hideLoading()
        view?.show(tracks: tracks)
    }
    
    func onError() {
        view?.hideLoading()
        view?.showError()
    }
}
