//
//  TracksTableViewModel.swift
//  SongsBrowser
//
//  Created by Kamil Chlebuś on 22/10/2017.
//  Copyright © 2017 Kamil Chlebuś. All rights reserved.
//

import UIKit
import Nuke

class TracksTableViewModel {

    let apiClient = iTunesAPIClient()
    let artistsGenerator = RandomArtistGenerator()
    let imageManager = Nuke.Manager.shared
    var tracks: [Track] = []
    let cellIdentifier = "TrackTableViewCell"
    let cellNibName = "TrackTableViewCell"
    let detailViewIdentifier = "TrackDetailViewController"
    let storyboardIdentifier = "Main"

    weak var delegate: TracksTableDelegate?

    var numberOfRowsInSection: Int {
        return tracks.count
    }

    func track(at indexPath: IndexPath) -> Track {
        return tracks[indexPath.row]
    }

    func loadTracks() -> String {
        let randomArtist = artistsGenerator.getRandomArtist()
        apiClient.fetchTracks(for: randomArtist) { [weak self] (tracks, error) in
            self?.tracks.append(contentsOf: tracks)
            DispatchQueue.main.async {
                self?.delegate?.reloadTableData()
            }
        }
        return randomArtist
    }

    func loadImage(at indexPath: IndexPath, into imageView: UIImageView) {
        let track = self.track(at: indexPath)
        imageManager.loadImage(with: Request(url: track.artworkUrl), into: imageView)
    }

}
