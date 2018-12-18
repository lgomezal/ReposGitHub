//
//  RGHForksViewController.swift
//  ReposGitHub
//
//  Created by luis gomez alonso on 18/12/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import UIKit

class RGHForksViewController: UIViewController {

    @IBOutlet weak var forksTableView: UITableView!
    
    let forkTableViewCellId = Constants.forkCVCId
    
    var repository: RGHRepository?
    var forks: RGHForksUsers?
    var totalForks: RGHForksUsers?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Forks"
        
        //Initialize totalWatchers
        self.totalForks = RGHForksUsers()
        
        //Delegate
        self.forksTableView.delegate = self
        self.forksTableView.dataSource = self
        
        //Register nibCell
        let nibCell = UINib(nibName: forkTableViewCellId, bundle: nil)
        forksTableView.register(nibCell, forCellReuseIdentifier: forkTableViewCellId)
        
        //Recover forks from API
        RGHExecuteInteractorImpl().execute {
            if let forksUrl = repository?.forksUrl {
                self.forksDownload(forksUrl: forksUrl)
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        nextUrlForks = ""
        hasMorePagesForks = false
    }
    
    func forksDownload(forksUrl: String) {
        
        //Configure activity indicator
        activityIndicator.frame = view.bounds
        activityIndicator.style = .gray
        activityIndicator.center = self.view.center
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
        
        let downloadForksInteractor: RGHDownloadForksInteractor = RGHDownloadForksInteractorAlamofireImpl()
        
        downloadForksInteractor.execute(forksUrl: forksUrl) { (forks: RGHForksUsers?) in
            // OK, load forks in tableview
            self.forks = forks
            // Add forks to Totalforks
            if let forksCount = self.forks?.count() {
                if forksCount > 0 {
                    //Initialize totalforks if nextpageurl is empty
                    if hasMorePagesForks == false {
                        self.totalForks = RGHForksUsers()
                    }
                    for i in 0..<forksCount {
                        let fork: RGHFork = ((self.forks?.get(index: i))!)
                        self.totalForks?.add(fork: fork)
                    }
                    self.forksTableView.reloadData()
                }
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        activityIndicator.center = self.view.center
    }
}
