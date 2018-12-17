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

    @IBOutlet weak var scrollView: UIScrollView!
    @IBOutlet weak var detailView: UIView!
    @IBOutlet weak var detailImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!
    @IBOutlet weak var starLabel: UILabel!
    @IBOutlet weak var forksLabel: UILabel!
    @IBOutlet weak var languageLabel: UILabel!
    @IBOutlet weak var issuesLabel: UILabel!
    @IBOutlet weak var sizeLabel: UILabel!
    @IBOutlet weak var licenseLabel: UILabel!
    @IBOutlet weak var lastUpdateLabel: UILabel!
    @IBOutlet weak var loginLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Ajust constraints of imagesview
        self.adjustConstraints()
        //Setup labels
        self.setupLabels()
        //Put border to imageView
        self.putBorder()
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        self.descriptionTextView.setContentOffset(CGPoint.zero, animated: false)
    }

    func adjustConstraints() {
        self.detailImage.heightAnchor.constraint(equalToConstant: (100 * (UIScreen.main.bounds.width)) / 414 ).isActive = true
        self.detailImage.widthAnchor.constraint(equalToConstant: (100 * (UIScreen.main.bounds.width)) / 414 ).isActive = true
        self.detailView.heightAnchor.constraint(equalToConstant: (250 * (UIScreen.main.bounds.width)) / 414 ).isActive = true
        self.detailView.widthAnchor.constraint(equalToConstant: (250 * (UIScreen.main.bounds.width)) / 414 ).isActive = true
        //self.descriptionTextView.heightAnchor.constraint(equalToConstant: (75 * (UIScreen.main.bounds.width)) / 414 ).isActive = true
        //self.descriptionTextView.widthAnchor.constraint(equalToConstant: (75 * (UIScreen.main.bounds.width)) / 414 ).isActive = true
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
        self.descriptionTextView.text = self.repository?.description
        
        /*self.starLabel.text = "\(self.repository?.stargazersCount ?? 0)"
        self.forksLabel.text = "\(self.repository?.forksCount ?? 0)"
        self.languageLabel.text = self.repository?.language
        self.issuesLabel.text = "\(self.repository?.issuesCount ?? 0)"
        if let sizeBytes: Int = self.repository?.size {
            self.sizeLabel.text = "\(sizeBytes / 1024) Kb"
        }
        self.licenseLabel.text = self.repository?.license?.name
        let formatter = DateFormatter()
         formatter.dateFormat = "dd MMM,yyyy"
        if let date = self.repository!.updatedAt {
            let day = formatter.string(from: date)
            self.lastUpdateLabel.text = "\(day)"
        } else {
            let day = ""
            self.lastUpdateLabel.text = "\(day)"
        }
        self.loginLabel.text = self.repository?.owner?.login*/
    }


}
