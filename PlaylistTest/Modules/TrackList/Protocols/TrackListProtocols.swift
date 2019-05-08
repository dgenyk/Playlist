//
//  TrackListProtocols.swift
//  PlaylistTest
//
//  Created by Dmytro Genyk on 5/5/19.
//  Copyright © 2019 Dmytro Genyk. All rights reserved.
//

import UIKit

// PRESENTER -> VIEW
protocol TrackViewProtocol: ViewProtocol {
    var presenter: TracksPresenterProtocol? { get set }
    func show(tracks: [TrackItem])
}

// PRESENTER -> ROUTER
protocol TracksRouterProtocol: RouterProtocol {
    func presentTrackDetailScreen(from view: TrackViewProtocol, forTrack trackID: String)
}

// VIEW -> PRESENTER
protocol TracksPresenterProtocol: class {
    var view: TrackViewProtocol? { get set }
    var interactor: TracksInteractorInputProtocol? { get set }
    var router: TracksRouterProtocol? { get set }

    func loadTracks()
    func showTrackDetail(forTrack trackID: String)
}

// INTERACTOR -> PRESENTER
protocol TracksInteractorOutputProtocol: ErrorHandlerProtocol {
    func didRetrieveTracks(_ tracks: [TrackItem])
}

// PRESENTER -> INTERACTOR
protocol TracksInteractorInputProtocol: class {
    var presenter: TracksInteractorOutputProtocol? { get set }
    var dataManager: TracksDataManagerInputProtocol? { get set }

    func retrieveTrackList(page: Int, pageLimit: Int)
}

// INTERACTOR -> REMOTEDATAMANAGER
protocol TracksDataManagerInputProtocol: class {
    var remoteRequestHandler: TracksDataManagerOutputProtocol? { get set }

    func retrieveTrackList(page: Int, pageLimit: Int)
}

// DATAMANAGER -> INTERACTOR
protocol TracksDataManagerOutputProtocol: ErrorHandlerProtocol {
    func onTracksRetrieved(_ tracks: [TrackItem])
}
