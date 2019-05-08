//
//  TrackDetailsInteractor.swift
//  PlaylistTest
//
//  Created by Dmytro Genyk on 5/6/19.
//  Copyright © 2019 Dmytro Genyk. All rights reserved.
//

import Foundation


class TrackDetailsInteractor: TrackDetailsInteractorInputProtocol {
    var presenter: TrackDetailsInteractorOutputProtocol?
    var dataManager: TrackDetailsDataManagerInputProtocol?
    
    func retrieveTrackDetails(_ trackID: String) {
        dataManager?.retrieveTrackDetails(trackID)
    }
}

extension TrackDetailsInteractor: TrackDetailsDataManagerOutputProtocol {
    func onTrackDetailsRetrieved(_ track: TrackItem) {
        presenter?.didRetrieveTrackDetails(track)
    }
    
    func onError() {
        presenter?.onError()
    }
}
