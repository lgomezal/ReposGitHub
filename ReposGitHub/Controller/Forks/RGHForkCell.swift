//
//  RGHForkCell.swift
//  ReposGitHub
//
//  Created by luis gomez alonso on 18/12/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import UIKit

class RGHForkCell: UITableViewCell {

    @IBOutlet weak var forkUserImage: UIImageView!
    @IBOutlet weak var forkUserLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        forkUserImage.layer.cornerRadius = 10
        forkUserImage.clipsToBounds = true
        forkUserImage.layer.borderWidth = 3
        forkUserImage.layer.borderColor = UIColor.white.cgColor
    }
    
    func refresh(fork: RGHFork, index: Int) {
        let url = URL(string: fork.owner.avatar_url)
        self.forkUserImage.kf.setImage(with: url)
        self.forkUserLabel.text = fork.owner.login
    }
    
}
