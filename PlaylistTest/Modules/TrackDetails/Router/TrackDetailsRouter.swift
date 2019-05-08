//
//  TrackDetailsRouter.swift
//  PlaylistTest
//
//  Created by Dmytro Genyk on 5/6/19.
//  Copyright © 2019 Dmytro Genyk. All rights reserved.
//

import UIKit

class TrackDetailsRouter: TrackDetailsRouterProtocol {
    static func createModule(trackID: String) -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let view = storyboard.instantiateViewController(withIdentifier: "TrackDetails") as? TrackDetailsViewController else {
            fatalError("wrong view controller for TrackListRouter")
        }
        let presenter = TrackDetailsPresenter()
        let router = TrackDetailsRouter()
        let interactor = TrackDetailsInteractor()
        let dataManager = TrackDetailsDataManager()
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        presenter.trackID = trackID
        interactor.presenter = presenter
        interactor.dataManager = dataManager
        dataManager.remoteRequestHandler = interactor
        
        return view
    }
    
}
