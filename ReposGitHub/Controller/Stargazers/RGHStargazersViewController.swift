//
//  RGHStargazersViewController.swift
//  ReposGitHub
//
//  Created by luis gomez alonso on 18/12/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import UIKit

class RGHStargazersViewController: UIViewController {
    
    @IBOutlet weak var stargazersTableView: UITableView!
    
    let stargazerTableViewCellId = Constants.stargazerCVCId
    
    var repository: RGHRepository?
    var gazers: RGHGazers?
    var totalGazers: RGHGazers?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Stargazers"
        
        //Initialize totalGazers
        self.totalGazers = RGHGazers()
        
        //Delegate
        self.stargazersTableView.delegate = self
        self.stargazersTableView.dataSource = self
        
        //Register nibCell
        let nibCell = UINib(nibName: stargazerTableViewCellId, bundle: nil)
        stargazersTableView.register(nibCell, forCellReuseIdentifier: stargazerTableViewCellId)
        
        //Recover startgazers from API
        RGHExecuteInteractorImpl().execute {
            if let stargazerUrl = repository?.stargazerUrl {
                self.gazersDownload(stargazerUrl: stargazerUrl)
            }
        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        nextUrlStargazers = ""
        hasMorePagesStargazers = false
    }
    
    func gazersDownload(stargazerUrl: String) {
        
        //Configure activity indicator
        activityIndicator.frame = view.bounds
        activityIndicator.style = .gray
        activityIndicator.center = self.view.center
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
        
        let downloadGazersInteractor: RGHDownloadGazersInteractor = RGHDownloadGazersInteractorAlamofireImpl()
        
        downloadGazersInteractor.execute(stargazerUrl: stargazerUrl) { (gazers: RGHGazers?) in
            // OK, load gazers in tableview
            self.gazers = gazers
            // Add repositories to TotalGazers
            if let gazersCount = self.gazers?.count() {
                if gazersCount > 0 {
                    //Initialize totalGazers if nextpageurl is empty
                    if hasMorePagesStargazers == false {
                        self.totalGazers = RGHGazers()
                    }
                    for i in 0..<gazersCount {
                        let stargazer: RGHStargazer = ((self.gazers?.get(index: i))!)
                        self.totalGazers?.add(stargazer: stargazer)
                    }
                    self.stargazersTableView.reloadData()
                }
            }
        }
    }
    
    override func viewDidLayoutSubviews() {
        activityIndicator.center = self.view.center
    }
}
