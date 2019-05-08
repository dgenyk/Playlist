//
//  UserListTableViewCell.swift
//  PlaylistTest
//
//  Created by Dmytro Genyk on 5/5/19.
//  Copyright © 2019 Dmytro Genyk. All rights reserved.
//

import UIKit

class UserListTableViewCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    @IBOutlet private weak var scoreLabel: UILabel!
    
    var user: UserItem? {
        didSet { updateView(user) }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func prepareForReuse() {
        super.prepareForReuse()
        updateView()
    }
    
    private func updateView(_ user: UserItem? = nil) {
        self.titleLabel?.text = user?.name
        var scoreText: String?
        if let user = user {
            scoreText = "\(user.score)"
        }
        self.scoreLabel?.text = scoreText
    }
}
