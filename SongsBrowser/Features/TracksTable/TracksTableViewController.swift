//
//  TracksTableViewController.swift
//  SongsBrowser
//
//  Created by Kamil Chlebuś on 21/10/2017.
//  Copyright © 2017 Kamil Chlebuś. All rights reserved.
//

import UIKit

class TracksTableViewController: UITableViewController {

    let viewModel = TracksTableViewModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: viewModel.cellNibName, bundle: nil), forCellReuseIdentifier: viewModel.cellIdentifier)
        viewModel.delegate = self
        title = viewModel.loadTracks()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRowsInSection
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: viewModel.cellIdentifier, for: indexPath) as! TrackTableViewCell
        cell.track = viewModel.track(at: indexPath)
        viewModel.loadImage(at: indexPath, into: cell.artworkImageView)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let selectedCell = tableView.cellForRow(at: indexPath) as! TrackTableViewCell
        showDetailController(for: selectedCell)
        tableView.deselectRow(at: indexPath, animated: true)
    }

    private func showDetailController(for cell: TrackTableViewCell) {
        if let detailController = UIStoryboard(name: viewModel.storyboardIdentifier, bundle: nil)
            .instantiateViewController(withIdentifier: viewModel.detailViewIdentifier) as? TrackDetailViewController {
            detailController.viewModel = TrackDetailViewModel(
                track: cell.track,
                artworkImage: cell.artworkImageView.image
            )
            show(detailController, sender: nil)
        }
    }

}

extension TracksTableViewController: TracksTableDelegate {

    func reloadTableData() {
        self.tableView.reloadData()
    }

}
