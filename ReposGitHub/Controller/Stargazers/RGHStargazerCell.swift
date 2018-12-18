//
//  RGHStargazerCell.swift
//  ReposGitHub
//
//  Created by luis gomez alonso on 18/12/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import UIKit

class RGHStargazerCell: UITableViewCell {

    @IBOutlet weak var stargazerImage: UIImageView!
    @IBOutlet weak var stargazerName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        stargazerImage.layer.cornerRadius = 10
        stargazerImage.clipsToBounds = true
        stargazerImage.layer.borderWidth = 3
        stargazerImage.layer.borderColor = UIColor.white.cgColor
    }
    
    func refresh(stargazer: RGHStargazer, index: Int) {
        let url = URL(string: stargazer.avatarUrl!)
        self.stargazerImage.kf.setImage(with: url)
        self.stargazerName.text = stargazer.login
    }
    
}
