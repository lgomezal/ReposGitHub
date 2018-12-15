//
//  RGHRepositoriesViewController.swift
//  ReposGitHub
//
//  Created by luis gomez alonso on 14/12/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import UIKit

let activityIndicator = UIActivityIndicatorView(style: .gray)
var nextPage: String = "1"

class RGHRepositoriesViewController: UIViewController {
    
    @IBOutlet weak var repositoriesCollectionView: UICollectionView!
    
    let repositoryCollectionViewCellId = Constants.repositoryCVCId
    
    var repositories: RGHRepositories?
    var totalRepos: RGHRepositories?

    override func viewDidLoad() {
        super.viewDidLoad()

        //Initialize totalRepos
        totalRepos = RGHRepositories()
        
        //Register nibCell
        let nibCell = UINib(nibName: repositoryCollectionViewCellId, bundle: nil)
        repositoriesCollectionView.register(nibCell, forCellWithReuseIdentifier: repositoryCollectionViewCellId)
        
        //Configure activity indicator
        activityIndicator.frame = view.bounds
        activityIndicator.style = .gray
        activityIndicator.center = self.view.center
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
        
        //Download repositories
        RGHExecuteInteractorImpl().execute {
            repositoriesDownload(nextPageParam: nextPage)
        }
        
    }
    
    func repositoriesDownload(nextPageParam: String) {
        
        let downloadRepositoriesInteractor: RGHDownloadRepositoriesInteractor = RGHDownloadRepositoriesInteractorAlamofireImpl()
        
        downloadRepositoriesInteractor.execute(nextPageParam: nextPage) { (repositories: RGHRepositories?) in
            
            // OK, load repositories in collectionView
            self.repositories = repositories
            // Add repositories to TotalRepos
            if let repoCount = self.repositories?.count() {
                for i in 0..<repoCount {
                    let repository: RGHRepository = ((self.repositories?.get(index: i))!)
                    self.totalRepos?.add(repository: repository)
                }
            }
            
            
            self.repositoriesCollectionView.collectionViewLayout.invalidateLayout()
            self.repositoriesCollectionView.delegate = self
            self.repositoriesCollectionView.dataSource = self
            self.repositoriesCollectionView.reloadData()
            
        }
    }
}
