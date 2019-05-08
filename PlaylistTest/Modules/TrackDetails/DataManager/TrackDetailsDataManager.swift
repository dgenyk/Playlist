//
//  TrackDetailsDataManager.swift
//  PlaylistTest
//
//  Created by Dmytro Genyk on 5/6/19.
//  Copyright © 2019 Dmytro Genyk. All rights reserved.
//

import Foundation
import Alamofire

class TrackDetailsDataManager: TrackDetailsDataManagerInputProtocol {
    var remoteRequestHandler: TrackDetailsDataManagerOutputProtocol?
    
    func retrieveTrackDetails(_ trackID: String) {
        Alamofire
            .request(Endpoints.Track.fetch(trackId: trackID).url,
                     method: .get)
            .responseData { response in
                switch response.result {
                case .success(let jsonData):
                    do {
                        let jsonDecoder = JSONDecoder()
                        let track = try jsonDecoder.decode(TrackItem.self, from: jsonData)
                        self.remoteRequestHandler?.onTrackDetailsRetrieved(track)
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
