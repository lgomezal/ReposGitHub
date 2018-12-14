//
//  RGHRepositoriesViewController.swift
//  ReposGitHub
//
//  Created by luis gomez alonso on 14/12/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import UIKit

let activityIndicator = UIActivityIndicatorView(style: .gray)

class RGHRepositoriesViewController: UIViewController {
    
    @IBOutlet weak var repositoriesCollectionView: UICollectionView!
    
    let repositoryCollectionViewCellId = Constants.repositoryCVCId
    
    var repositories: RGHRepositories?

    override func viewDidLoad() {
        super.viewDidLoad()

        //Register nibCell
        let nibCell = UINib(nibName: repositoryCollectionViewCellId, bundle: nil)
        repositoriesCollectionView.register(nibCell, forCellWithReuseIdentifier: repositoryCollectionViewCellId)
        
        //Configure activity indicator
        view.addSubview(activityIndicator)
        activityIndicator.frame = view.bounds
        activityIndicator.style = .gray
        activityIndicator.startAnimating()
        
        //Download repositories
        RGHExecuteInteractorImpl().execute {
            repositoriesDownload()
        }
        
        func repositoriesDownload() {
            
            let downloadRepositoriesInteractor: RGHDownloadRepositoriesInteractor = RGHDownloadRepositoriesInteractorAlamofireImpl()
            
            downloadRepositoriesInteractor.execute() { (repositories: RGHRepositories?) in
                
                // OK, load repositories in collectionView
                self.repositories = repositories
                
                self.repositoriesCollectionView.collectionViewLayout.invalidateLayout()
                self.repositoriesCollectionView.delegate = self
                self.repositoriesCollectionView.dataSource = self
                self.repositoriesCollectionView.reloadData()
                
            }
        }
        
    }



}
