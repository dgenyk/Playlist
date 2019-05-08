//
//  TrackDetailsViewController.swift
//  PlaylistTest
//
//  Created by Dmytro Genyk on 5/6/19.
//  Copyright © 2019 Dmytro Genyk. All rights reserved.
//

import UIKit
import AlamofireImage

class TrackDetailsViewController: UIViewController {
    var presenter: TrackDetailsPresenterProtocol?

    @IBOutlet private weak var trackImageView: UIImageView!
    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var artistLabel: UILabel!
    @IBOutlet private weak var durationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter?.loadTrackDetails()
        titleLabel.text = nil
        artistLabel.isHidden = true
        durationLabel.text = nil
    }
}

extension TrackDetailsViewController: TrackDetailsViewProtocol {
    func show(track: TrackItem) {
        trackImageView.af_setImage(withURL: track.albumArtUrl)
        titleLabel.text = track.title
        if let artist = track.artist {
            artistLabel.text = artist
            artistLabel.isHidden = false
        }
        durationLabel.text = "\(track.duration)"
    }
    
    func showError() {
        print("Data loading error!")
    }
    
    func showLoading() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = true
    }
    
    func hideLoading() {
        UIApplication.shared.isNetworkActivityIndicatorVisible = false
    }
}
