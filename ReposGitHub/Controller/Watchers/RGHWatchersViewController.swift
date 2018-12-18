//
//  RGHWatchersViewController.swift
//  ReposGitHub
//
//  Created by luis gomez alonso on 18/12/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import UIKit

class RGHWatchersViewController: UIViewController {

    @IBOutlet weak var watchersTableView: UITableView!
    
    let watcherTableViewCellId = Constants.watcherCVCId
    
    var repository: RGHRepository?
    var watchers: RGHWatchersUsers?
    var totalWatchers: RGHWatchersUsers?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Watchers"
        
        //Initialize totalWatchers
        self.totalWatchers = RGHWatchersUsers()
        
        //Delegate
        self.watchersTableView.delegate = self
        self.watchersTableView.dataSource = self
        
        //Register nibCell
        let nibCell = UINib(nibName: watcherTableViewCellId, bundle: nil)
        watchersTableView.register(nibCell, forCellReuseIdentifier: watcherTableViewCellId)
        
        //Recover watchers from API
        RGHExecuteInteractorImpl().execute {
            if let watcherUrl = repository?.subscriberUrl {
                self.watchersDownload(watcherUrl: watcherUrl)
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        nextUrlWatchers = ""
        hasMorePagesWatchers = false
    }
    
    func watchersDownload(watcherUrl: String) {
        
        //Configure activity indicator
        activityIndicator.frame = view.bounds
        activityIndicator.style = .gray
        activityIndicator.center = self.view.center
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
        
        let downloadWatchersInteractor: RGHDownloadWatchersInteractor = RGHDownloadWatchersInteractorAlamofireImpl()
        
        downloadWatchersInteractor.execute(watcherUrl: watcherUrl) { (watchers: RGHWatchersUsers?) in
            // OK, load gazers in tableview
            self.watchers = watchers
            // Add watchers to Totalwatchers
            if let watchersCount = self.watchers?.count() {
                if watchersCount > 0 {
                    //Initialize totalWatchers if nextpageurl is empty
                    if hasMorePagesWatchers == false {
                        self.totalWatchers = RGHWatchersUsers()
                    }
                    for i in 0..<watchersCount {
                        let watcher: RGHWatcher = ((self.watchers?.get(index: i))!)
                        self.totalWatchers?.add(watcher: watcher)
                    }
                    self.watchersTableView.reloadData()
                }
            }
        }
    }
}
