//
//  Endpoints.swift
//  PlaylistTest
//
//  Created by Dmytro Genyk on 5/5/19.
//  Copyright © 2019 Dmytro Genyk. All rights reserved.
//

import Foundation

struct API {
    static let baseUrl = "http://lc.playlist.com"
    static let trackPort = "3001"
    static let userPort = "3002"
}

protocol Endpoint {
    var path: String { get }
    var url: String { get }
}

enum Endpoints {
    enum Tracks: Endpoint {
        case fetch
        
        public var path: String {
            switch self {
            case .fetch: return "/tracks"
            }
        }
        
        public var url: String {
            switch self {
            case .fetch: return "\(API.baseUrl):\(API.trackPort)\(path)"
            }
        }
    }
    
    enum Track: Endpoint {
        case fetch(trackId: String)
        
        public var path: String {
            switch self {
            case .fetch: return "/tracks"
            }
        }
        
        public var url: String {
            switch self {
            case .fetch(let trackId): return "\(API.baseUrl):\(API.trackPort)\(path)/\(trackId)"
            }
        }
    }
    
    enum Users: Endpoint {
        case fetch
        
        public var path: String {
            switch self {
            case .fetch: return "/top_users"
            }
        }
        
        public var url: String {
            switch self {
            case .fetch: return "\(API.baseUrl):\(API.userPort)\(path)"
            }
        }
    }
}
