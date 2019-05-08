//
//  TrackInteractor.swift
//  PlaylistTest
//
//  Created by Dmytro Genyk on 5/5/19.
//  Copyright © 2019 Dmytro Genyk. All rights reserved.
//

import Foundation

class TrackInteractor: TracksInteractorInputProtocol {
    var presenter: TracksInteractorOutputProtocol?
    var dataManager: TracksDataManagerInputProtocol?
    
    func retrieveTrackList(page: Int, pageLimit: Int) {
        dataManager?.retrieveTrackList(page: page, pageLimit: pageLimit)
    }
}

extension TrackInteractor: TracksDataManagerOutputProtocol {
    func onTracksRetrieved(_ tracks: [TrackItem]) {
        presenter?.didRetrieveTracks(tracks)
    }
    
    func onError() {
        presenter?.onError()
    }
}
