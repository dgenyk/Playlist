//
//  TracksDataManager.swift
//  PlaylistTest
//
//  Created by Dmytro Genyk on 5/5/19.
//  Copyright © 2019 Dmytro Genyk. All rights reserved.
//

import Foundation
import Alamofire

class TracksDataManager: TracksDataManagerInputProtocol {
    var remoteRequestHandler: TracksDataManagerOutputProtocol?
    
    func retrieveTrackList(page: Int, pageLimit: Int) {
        Alamofire
            .request(Endpoints.Tracks.fetch.url,
                     method: .get,
                     parameters: ["_page": page,
                                  "_limit": pageLimit])
            .responseData { response in
                switch response.result {
                case .success(let jsonData):
                    do {
                        let jsonDecoder = JSONDecoder()
                        let tracks = try jsonDecoder.decode([TrackItem].self, from: jsonData)
                        self.remoteRequestHandler?.onTracksRetrieved(tracks)
                    }
                    catch {
                        self.remoteRequestHandler?.onError()
                    }
                case .failure( _):
                    self.remoteRequestHandler?.onError()
                }
        }
    }
    
}
