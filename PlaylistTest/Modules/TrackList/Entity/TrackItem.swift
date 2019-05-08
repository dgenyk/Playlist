//
//  TrackItem.swift
//  PlaylistTest
//
//  Created by Dmytro Genyk on 5/5/19.
//  Copyright © 2019 Dmytro Genyk. All rights reserved.
//

import Foundation


struct TrackItem: Codable {
    private enum CodingKeys: String, CodingKey {
        case title
        case albumArtUrl
        case artist
        case trackId = "id"
        case duration
    }
    
    var title: String
    var albumArtUrl: URL
    var artist: String?
    var trackId: String
    var duration: UInt
}
