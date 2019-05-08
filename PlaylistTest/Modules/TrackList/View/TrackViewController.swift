//
//  TracksViewController.swift
//  PlaylistTest
//
//  Created by Dmytro Genyk on 5/5/19.
//  Copyright © 2019 Dmytro Genyk. All rights reserved.
//

import UIKit

class TrackViewController: UITableViewController {
    var presenter: TracksPresenterProtocol?
    var tracksList: [TrackItem] = []
    let cellIdentifier = "trackCellIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Tracks"
        presenter?.loadTracks()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return tracksList.count
    }
    
    override func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if (indexPath.row == tracksList.count - 3) {
            presenter?.loadTracks()
        }
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier, for: indexPath) as? TrackTableViewCell else {
            return UITableViewCell()
        }
        cell.track = tracksList[indexPath.row];
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let trackItem = tracksList[indexPath.row]
        presenter?.showTrackDetail(forTrack: trackItem.trackId)
    }
}

extension TrackViewController: TrackViewProtocol {
    func showError() {
        print("Data loading error!")
    }
    
    func show(tracks: [TrackItem]) {
        tracksList.append(contentsOf: tracks)
        tableView.reloadData()
    }
    
    func showLoading() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func hideLoading() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}
