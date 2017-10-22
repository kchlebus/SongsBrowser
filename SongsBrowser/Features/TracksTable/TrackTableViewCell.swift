//
//  TrackTableViewCell.swift
//  SongsBrowser
//
//  Created by Kamil Chlebuś on 21/10/2017.
//  Copyright © 2017 Kamil Chlebuś. All rights reserved.
//

import UIKit

class TrackTableViewCell: UITableViewCell {

    @IBOutlet var artworkImageView: UIImageView!
    @IBOutlet var trackNameLabel: UILabel!
    @IBOutlet var collectionNameLabel: UILabel!

    var track: Track! {
        didSet {
            configure()
        }
    }

    private func configure() {
        trackNameLabel.text = track.trackName
        collectionNameLabel.text = track.collectionName
    }

}
