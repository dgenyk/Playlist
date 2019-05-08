//
//  TrackDetailsProtocols.swift
//  PlaylistTest
//
//  Created by Dmytro Genyk on 5/6/19.
//  Copyright © 2019 Dmytro Genyk. All rights reserved.
//

import UIKit

// PRESENTER -> VIEW
protocol TrackDetailsViewProtocol: ViewProtocol {
    var presenter: TrackDetailsPresenterProtocol? { get set }
    
    func show(track: TrackItem)
}

// PRESENTER -> ROUTER
protocol TrackDetailsRouterProtocol: class {
    static func createModule(trackID: String) -> UIViewController
}

// VIEW -> PRESENTER
protocol TrackDetailsPresenterProtocol: class {
    var view: TrackDetailsViewProtocol? { get set }
    var interactor: TrackDetailsInteractorInputProtocol? { get set }
    var router: TrackDetailsRouterProtocol? { get set }
    var trackID: String? { get set }
    
    func loadTrackDetails()
}

// INTERACTOR -> PRESENTER
protocol TrackDetailsInteractorOutputProtocol: ErrorHandlerProtocol {
    func didRetrieveTrackDetails(_ track: TrackItem)
    func onError()
}

// PRESENTER -> INTERACTOR
protocol TrackDetailsInteractorInputProtocol: class {
    var presenter: TrackDetailsInteractorOutputProtocol? { get set }
    var dataManager: TrackDetailsDataManagerInputProtocol? { get set }
    
    func retrieveTrackDetails(_ trackID: String)
}

// INTERACTOR -> REMOTEDATAMANAGER
protocol TrackDetailsDataManagerInputProtocol: class {
    var remoteRequestHandler: TrackDetailsDataManagerOutputProtocol? { get set }
    
    func retrieveTrackDetails(_ trackID: String)
}

// DATAMANAGER -> INTERACTOR
protocol TrackDetailsDataManagerOutputProtocol: ErrorHandlerProtocol {
    func onTrackDetailsRetrieved(_ track: TrackItem)
}
