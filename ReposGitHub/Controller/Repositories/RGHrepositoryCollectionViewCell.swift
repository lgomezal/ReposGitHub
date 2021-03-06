//
//  RGHRepositoryCollectionViewCell.swift
//  ReposGitHub
//
//  Created by luis gomez alonso on 14/12/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import UIKit
import Kingfisher

class RGHRepositoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var avatarImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var starLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var cellView: UIView!
    @IBOutlet weak var starImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //Ajust constraints of imagesview
        self.adjustConstraints()
    
        //Put border to cellView
        cellView.layer.cornerRadius = 10
        cellView.clipsToBounds = true
        cellView.layer.borderWidth = 3
        cellView.layer.borderColor = UIColor.lightGray.cgColor
        //Put border to imageview
        avatarImage.layer.cornerRadius = 10
        avatarImage.clipsToBounds = true
        avatarImage.layer.borderWidth = 3
        avatarImage.layer.borderColor = UIColor.lightGray.cgColor
    }
    
    func refresh(repository: RGHRepository, index: Int) {
        
        if let url = URL(string: (repository.owner?.avatar_url)!) {
            avatarImage.kf.setImage(with: url)
        }
        self.nameLabel.text = repository.name
        if let starts = repository.stargazersCount {
            self.starLabel.text = String(starts)
        }
        self.languageLabel.text = repository.language
        self.descriptionLabel.text = repository.description

    }
    
    func adjustConstraints() {
        self.avatarImage.heightAnchor.constraint(equalToConstant: (75 * (UIScreen.main.bounds.width)) / 414 ).isActive = true
        self.avatarImage.widthAnchor.constraint(equalToConstant: (75 * (UIScreen.main.bounds.width)) / 414 ).isActive = true
        self.starImage.heightAnchor.constraint(equalToConstant: (30 * (UIScreen.main.bounds.width)) / 414 ).isActive = true
        self.starImage.widthAnchor.constraint(equalToConstant: (30 * (UIScreen.main.bounds.width)) / 414 ).isActive = true
    }

}
