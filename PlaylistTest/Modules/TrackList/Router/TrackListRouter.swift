//
//  TrackRouter.swift
//  PlaylistTest
//
//  Created by Dmytro Genyk on 5/5/19.
//  Copyright © 2019 Dmytro Genyk. All rights reserved.
//

import UIKit

class TrackListRouter: TracksRouterProtocol {
    static func createModule() -> UIViewController {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        guard let view = storyboard.instantiateViewController(withIdentifier: "TrackList") as? TrackViewController else {
            fatalError("wrong view controller for TrackListRouter")
        }
        let navigationController = UINavigationController(rootViewController: view)
        let presenter = TrackPresenter()
        let router = TrackListRouter()
        let interactor = TrackInteractor()
        let dataManager = TracksDataManager()
        view.presenter = presenter
        presenter.view = view
        presenter.router = router
        presenter.interactor = interactor
        interactor.presenter = presenter
        interactor.dataManager = dataManager
        dataManager.remoteRequestHandler = interactor
        
        return navigationController
    }
    
    func presentTrackDetailScreen(from view: TrackViewProtocol, forTrack trackID: String) {
        let trackDetailViewController = TrackDetailsRouter.createModule(trackID: trackID)

        if let sourceView = view as? UIViewController {
            sourceView.navigationController?.pushViewController(trackDetailViewController, animated: true)
        }
    }

}
