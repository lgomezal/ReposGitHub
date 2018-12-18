//
//  RGHWatcherCell.swift
//  ReposGitHub
//
//  Created by luis gomez alonso on 18/12/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import UIKit

class RGHWatcherCell: UITableViewCell {

    @IBOutlet weak var watcherImage: UIImageView!
    @IBOutlet weak var watcherLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        watcherImage.layer.cornerRadius = 10
        watcherImage.clipsToBounds = true
        watcherImage.layer.borderWidth = 3
        watcherImage.layer.borderColor = UIColor.white.cgColor
    }
    
    func refresh(watcher: RGHWatcher, index: Int) {
        let url = URL(string: watcher.avatarUrl!)
        self.watcherImage.kf.setImage(with: url)
        self.watcherLabel.text = watcher.login
    }
    
}
