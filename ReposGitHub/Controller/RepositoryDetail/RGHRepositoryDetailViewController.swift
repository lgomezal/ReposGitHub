//
//  RGHRepositoryDetailViewController.swift
//  ReposGitHub
//
//  Created by luis gomez alonso on 16/12/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import UIKit
import Kingfisher

class RGHRepositoryDetailViewController: UIViewController {
    
    var repository: RGHRepository?

    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var starLabel: UILabel!
    @IBOutlet weak var watchersLabel: UILabel!
    @IBOutlet weak var forksLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //Ajust constraints of imagesview
        self.adjustConstraints()
        //Setup labels
        self.setupLabels()
        //Put border to imageView
        self.putBorder()
        
    }

    func adjustConstraints() {
        self.detailImage.heightAnchor.constraint(equalToConstant: (100 * (UIScreen.main.bounds.width)) / 414 ).isActive = true
        self.detailImage.widthAnchor.constraint(equalToConstant: (100 * (UIScreen.main.bounds.width)) / 414 ).isActive = true
        self.detailView.heightAnchor.constraint(equalToConstant: (250 * (UIScreen.main.bounds.width)) / 414 ).isActive = true
        self.detailView.widthAnchor.constraint(equalToConstant: (250 * (UIScreen.main.bounds.width)) / 414 ).isActive = true
    }
    
    func putBorder() {
        //Put border to imageview
        detailImage.layer.cornerRadius = 10
        detailImage.clipsToBounds = true
        detailImage.layer.borderWidth = 3
        detailImage.layer.borderColor = UIColor.white.cgColor
    }
    
    func setupLabels() {
        if let url = URL(string: (self.repository?.owner?.avatar_url)!) {
            detailImage.kf.setImage(with: url)
        }
        self.nameLabel.text = self.repository?.name
        self.descriptionLabel.text = self.repository?.description
        self.starLabel.text = "\(self.repository?.stargazersCount ?? 0)"
        self.forksLabel.text = "\(self.repository?.forksCount ?? 0)"

    }


}
