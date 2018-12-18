//
//  RGHReadmeViewController.swift
//  ReposGitHub
//
//  Created by luis gomez alonso on 17/12/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import UIKit
import WebKit

class RGHReadmeViewController: UIViewController {
    
    var repository: RGHRepository?
    var readme: RGHReadme?
    
    @IBOutlet weak var webView: WKWebView!
   
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "Readme file"
        
        //Recover readme file from API
        RGHExecuteInteractorImpl().execute {
            if let owner = self.repository?.owner?.login,
               let repositoryName = self.repository?.name {
                self.readmeDownload(owner: owner, repositoryName: repositoryName)
            }
        }
    }

    func readmeDownload(owner: String, repositoryName: String) {
        
        //Configure activity indicator
        activityIndicator.frame = view.bounds
        activityIndicator.style = .gray
        activityIndicator.center = self.view.center
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
        
        let downloadReadmeInteractor: RGHDownloadReadmeInteractor = RGHDownloadReadmeInteractorAlamofireImpl()
        
        downloadReadmeInteractor.execute(owner: owner, repositoryName: repositoryName) { (readme: RGHReadme?) in
            
            // OK
            if readme != nil {
                self.readme = readme
                if let url = URL(string: ((self.readme?.htmlUrl)!)) {
                    self.webView.load(URLRequest(url: url))
                }
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        activityIndicator.center = self.view.center
    }
}
