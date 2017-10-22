//
//  TrackDetailViewController.swift
//  SongsBrowser
//
//  Created by Kamil Chlebuś on 22/10/2017.
//  Copyright © 2017 Kamil Chlebuś. All rights reserved.
//

import UIKit

class TrackDetailViewController: UIViewController {

    @IBOutlet private var backButton: UIButton!
    @IBOutlet private var artworkBackgroundImageView: UIImageView!
    @IBOutlet private var artworkThumbnailImageView: UIImageView!
    @IBOutlet private var artistNameLabel: UILabel!
    @IBOutlet private var trackNameLabel: UILabel!
    @IBOutlet private var collectionNameLabel: UILabel!
    @IBOutlet private var detailsView: UIView!
    @IBOutlet private var relasedLabel: UILabel!
    @IBOutlet private var genreLabel: UILabel!
    @IBOutlet private var timeLabel: UILabel!
    @IBOutlet private var trackNumberLabel: UILabel!
    @IBOutlet private var priceLabel: UILabel!

    var viewModel: TrackDetailViewModel!

    // MARK: - Life cycle

    override func viewDidLoad() {
        super.viewDidLoad()
        setData()
        setUI()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.isNavigationBarHidden = true
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.navigationController?.isNavigationBarHidden = false
    }

    // MARK: - Init

    private func setData() {
        artworkBackgroundImageView.image = viewModel.artworkImage
        artworkThumbnailImageView.image = viewModel.artworkImage
        artistNameLabel.text = viewModel.artistName
        trackNameLabel.text = viewModel.trackName
        collectionNameLabel.text = viewModel.collectionName
        relasedLabel.text = viewModel.releaseDate
        genreLabel.text = viewModel.genre
        timeLabel.text = viewModel.time
        trackNumberLabel.text = viewModel.trackNumberAndCount
        priceLabel.text = viewModel.price
    }

    private func setUI() {
        setDetailsView()
        setArtworkThumbnailImageView()
    }

    private func setDetailsView() {
        detailsView.layer.shadowColor = UIColor.lightGray.cgColor
        detailsView.layer.shadowOffset = CGSize(width: 0, height: 1)
        detailsView.layer.shadowRadius = 2
        detailsView.layer.shadowOpacity = 0.7
    }

    private func setArtworkThumbnailImageView() {
        artworkThumbnailImageView.layer.borderWidth = 2.0
        artworkThumbnailImageView.layer.borderColor = UIColor.white.cgColor
    }

    // MARK: - Actions

    @IBAction func backTapped() {
        navigationController?.popViewController(animated: true)
    }

    @IBAction func downloadTapped() {
        // Won't work on simulator
        if UIApplication.shared.canOpenURL(viewModel.trackUrl) {
            UIApplication.shared.open(viewModel.trackUrl, options: [:])
        }
    }

}
