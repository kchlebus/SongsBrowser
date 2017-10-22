//
//  Track.swift
//  SongsBrowser
//
//  Created by Kamil Chlebuś on 21/10/2017.
//  Copyright © 2017 Kamil Chlebuś. All rights reserved.
//

import Foundation

struct Track: Codable {

    var artistName: String
    var artworkUrl: URL
    var collectionName: String?
    var genre: String
    var releaseDate: Date
    var trackCount: Int?
    var trackExplicitness: String
    var trackName: String
    var trackNumber: Int?
    var trackPrice: Double
    var trackTime: TimeInterval
    var trackUrl: URL

    enum CodingKeys: String, CodingKey {
        case artistName
        case artworkUrl = "artworkUrl100"
        case collectionName
        case genre = "primaryGenreName"
        case releaseDate
        case trackCount
        case trackExplicitness
        case trackName
        case trackNumber
        case trackPrice
        case trackTime = "trackTimeMillis"
        case trackUrl = "trackViewUrl"
    }

}
