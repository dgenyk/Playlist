//
//  TrackTableViewCell.swift
//  PlaylistTest
//
//  Created by Dmytro Genyk on 5/5/19.
//  Copyright © 2019 Dmytro Genyk. All rights reserved.
//

import UIKit
import AlamofireImage

class TrackTableViewCell: UITableViewCell {
    
    @IBOutlet private weak var trackImageView: UIImageView!
    @IBOutlet private weak var trackTitleLabel: UILabel!
    @IBOutlet private weak var trackArtistLabel: UILabel!
    
    var track: TrackItem? {
        didSet { updateView(track) }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        // Initialization code
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        updateView()
    }
    
    private func updateView(_ track: TrackItem? = nil) {
        self.trackTitleLabel?.text = track?.title
        self.trackArtistLabel?.text = track?.artist
        if let imageURL = track?.albumArtUrl {
            self.trackImageView?.af_setImage(withURL: imageURL)
        } else {
            self.trackImageView?.image = nil
        }
        
    }
}
