//
//  TrackDetailViewModel.swift
//  SongsBrowser
//
//  Created by Kamil Chlebuś on 22/10/2017.
//  Copyright © 2017 Kamil Chlebuś. All rights reserved.
//

import UIKit

class TrackDetailViewModel {

    var artworkImage: UIImage?
    var artistName: String = ""
    var trackName: String = ""
    var collectionName: String = ""
    var releaseDate: String = ""
    var genre: String = ""
    var trackNumberAndCount: String = ""
    var time: String = ""
    var price: String = ""
    var trackUrl: URL!

    init(track: Track, artworkImage: UIImage?) {
        self.artworkImage = artworkImage
        self.artistName = track.artistName
        self.trackName = track.trackName
        self.collectionName = track.collectionName ?? ""
        self.releaseDate = formatRelaseDate(track.releaseDate)
        self.genre = track.genre
        self.trackNumberAndCount = formatTrackNumberAndCount(trackNumber: track.trackNumber, trackCount: track.trackCount)
        self.time = formatTime(track.trackTime)
        self.price = formatPrice(track.trackPrice)
        self.trackUrl = track.trackUrl
    }

    func formatRelaseDate(_ releaseDate: Date) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        return dateFormatter.string(from: releaseDate)
    }

    func formatTrackNumberAndCount(trackNumber: Int?, trackCount: Int?) -> String {
        if let trackNumber = trackNumber, let trackCount = trackCount {
            return "\(trackNumber) / \(trackCount)"
        } else {
            return "- / -"
        }
    }

    func formatPrice(_ price: Double) -> String {
        return "\(price)$"
    }

    func formatTime(_ timeMilis: TimeInterval) -> String {
        let timeSeconds = timeMilis/1000
        let minutes = Int((timeSeconds/60).truncatingRemainder(dividingBy: 60))
        let seconds = Int(timeSeconds.truncatingRemainder(dividingBy: 60))
        return String(format:"%d:%02d", minutes, seconds)
    }

}
