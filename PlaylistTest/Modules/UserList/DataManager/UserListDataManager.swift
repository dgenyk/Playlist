//
//  UserListDataManager.swift
//  PlaylistTest
//
//  Created by Dmytro Genyk on 5/7/19.
//  Copyright © 2019 Dmytro Genyk. All rights reserved.
//

import Foundation
import Alamofire

class UserListDataManager: UserListDataManagerInputProtocol {
    var remoteRequestHandler: UserListDataManagerOutputProtocol?
    
    func retrieveUsers() {
        Alamofire
            .request(Endpoints.Users.fetch.url,
                     method: .get)
            .responseData { response in
                switch response.result {
                case .success(let jsonData):
                    do {
                        let jsonDecoder = JSONDecoder()
                        let users = try jsonDecoder.decode([UserItem].self, from: jsonData)
                        self.remoteRequestHandler?.onUserListRetrieved(users)
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
