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
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var licenseLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var updateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        //Ajust constraints of imageview
        self.avatarImage.heightAnchor.constraint(equalToConstant: (75 * (UIScreen.main.bounds.width)) / 414 ).isActive = true
        self.avatarImage.widthAnchor.constraint(equalToConstant: (75 * (UIScreen.main.bounds.width)) / 414 ).isActive = true
        //Put border to imageview
        avatarImage.layer.cornerRadius = 10
        avatarImage.clipsToBounds = true
        avatarImage.layer.borderWidth = 3
        avatarImage.layer.borderColor = UIColor.black.cgColor
    }
    
    func refresh(repository: RGHRepository, index: Int) {
        
        if let url = URL(string: (repository.owner?.avatar_url)!) {
            avatarImage.kf.setImage(with: url)
        }
        self.nameLabel.text = repository.fullName
        if let starts = repository.stargazersCount {
            self.starLabel.text = String(starts)
        }
        self.languageLabel.text = repository.language
        self.licenseLabel.text = repository.license?.name
        self.descriptionLabel.text = repository.description
        
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM dd,yyyy"
        if let date = repository.updatedAt {
            let day = formatter.string(from: date)
            self.updateLabel.text = "\(day)"
        } else {
            let day = ""
            self.updateLabel.text = "\(day)"
        }

    }

}
