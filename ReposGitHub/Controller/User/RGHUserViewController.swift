//
//  RGHUserViewController.swift
//  ReposGitHub
//
//  Created by luis gomez alonso on 18/12/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import UIKit
import Kingfisher

class RGHUserViewController: UIViewController {

    
    @IBOutlet var userView: UIView!
    @IBOutlet weak var userAvatarImage: UIImageView!
    @IBOutlet weak var userNameLabel: UILabel!
    @IBOutlet weak var followersLabel: UILabel!
    @IBOutlet weak var followingLabel: UILabel!
    @IBOutlet weak var publicReposLabel: UILabel!
    @IBOutlet weak var locationLabel: UILabel!
    
    var repository: RGHRepository?
    var user: RGHUser?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "User"
        
        //Ajust constraints of imagesview
        self.adjustConstraints()
        
        //Recover user file from API
        RGHExecuteInteractorImpl().execute {
            if let userUrl = repository?.owner?.url {
                self.userDownload(userUrl: userUrl)
            }
        }
    }
    
    func userDownload(userUrl: String) {
        
        //Configure activity indicator
        activityIndicator.frame = view.bounds
        activityIndicator.style = .gray
        activityIndicator.center = self.view.center
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
        
        let downloadUserInteractor: RGHDownloadUserInteractor = RGHDownloadUserInteractorAlamofireImpl()
        
        downloadUserInteractor.execute(userUrl: userUrl) { (user: RGHUser?) in
            
            // OK
            if user != nil {
                self.user = user
                //Put components of user in screen elements
                self.setupLabels()
                //Put border to imageView
                self.putBorder()
            }
        }
    }
    
    func setupLabels() {
        if let url = URL(string: (self.user?.avatarUrl)!) {
            self.userAvatarImage.kf.setImage(with: url)
        }
        self.userNameLabel.text = self.user?.name
        self.followersLabel.text = "\(self.user?.followers ?? 0)"
        self.followingLabel.text = "\(self.user?.following ?? 0)"
        self.publicReposLabel.text = "\(self.user?.publicRepos ?? 0)"
        self.locationLabel.text = self.user?.location
    }
    
    func adjustConstraints() {
        self.userAvatarImage.heightAnchor.constraint(equalToConstant: (100 * (UIScreen.main.bounds.width)) / 414 ).isActive = true
        self.userAvatarImage.widthAnchor.constraint(equalToConstant: (100 * (UIScreen.main.bounds.width)) / 414 ).isActive = true
        self.userView.heightAnchor.constraint(equalToConstant: (250 * (UIScreen.main.bounds.width)) / 414 ).isActive = true
        self.userView.widthAnchor.constraint(equalToConstant: (250 * (UIScreen.main.bounds.width)) / 414 ).isActive = true
    }
    
    func putBorder() {
        //Put border to imageview
        userAvatarImage.layer.cornerRadius = 10
        userAvatarImage.clipsToBounds = true
        userAvatarImage.layer.borderWidth = 3
        userAvatarImage.layer.borderColor = UIColor.white.cgColor
    }
    
    override func viewDidLayoutSubviews() {
        activityIndicator.center = self.view.center
    }
}
