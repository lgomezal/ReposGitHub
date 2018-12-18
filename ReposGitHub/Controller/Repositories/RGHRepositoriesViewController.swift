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
var queryText: String = ""
var nextUrlStargazers: String = ""
var hasMorePagesStargazers: Bool = false
var nextUrlWatchers: String = ""
var hasMorePagesWatchers: Bool = false

class RGHRepositoriesViewController: UIViewController {
    
    //UISearchController
    lazy var searchController: UISearchController? = {
        let searchController = UISearchController(searchResultsController: nil)
        searchController.obscuresBackgroundDuringPresentation = false
        definesPresentationContext = true
        
        return searchController
    }()
    
    @IBOutlet weak var repositoriesCollectionView: UICollectionView!
    
    
    let repositoryCollectionViewCellId = Constants.repositoryCVCId
    
    var repositories: RGHRepositories?
    var totalRepos: RGHRepositories?
    var hasFind: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Repositories"
        
        //Initialize totalRepos
        totalRepos = RGHRepositories()
        
        //Delegate
        self.repositoriesCollectionView.delegate = self
        self.repositoriesCollectionView.dataSource = self

        //SearchController
        navigationItem.searchController = searchController
        searchController?.searchBar.delegate = self
        
        //Register nibCell
        let nibCell = UINib(nibName: repositoryCollectionViewCellId, bundle: nil)
        repositoriesCollectionView.register(nibCell, forCellWithReuseIdentifier: repositoryCollectionViewCellId)
        
        //Download repositories
        RGHExecuteInteractorImpl().execute {
            repositoriesDownload(queryText: queryText, nextPageParam: nextPage)
        }
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //Configure navigationBar opaque and custom color, status bar white
        self.navigationController?.navigationBar.isTranslucent = false
        self.navigationController?.navigationBar.tintColor = .lightGray
        self.navigationController?.navigationBar.barStyle = .default
    }
    
    func repositoriesDownload(queryText: String, nextPageParam: String) {
        
        //Configure activity indicator
        activityIndicator.frame = view.bounds
        activityIndicator.style = .gray
        activityIndicator.center = self.view.center
        activityIndicator.startAnimating()
        view.addSubview(activityIndicator)
        
        let downloadRepositoriesInteractor: RGHDownloadRepositoriesInteractor = RGHDownloadRepositoriesInteractorAlamofireImpl()
        
        downloadRepositoriesInteractor.execute(queryText: queryText, nextPageParam: nextPage) { (repositories: RGHRepositories?) in
            
            // OK, load repositories in collectionView
            self.repositories = repositories
            // Add repositories to TotalRepos
            if let repoCount = self.repositories?.count() {
                //Initialize totalRepos if parameters empty
                if queryText == "" && nextPageParam == "" && self.hasFind == true {
                    self.totalRepos = RGHRepositories()
                    self.hasFind = false
                }
                for i in 0..<repoCount {
                    let repository: RGHRepository = ((self.repositories?.get(index: i))!)
                    self.totalRepos?.add(repository: repository)
                }
                self.repositoriesCollectionView.collectionViewLayout.invalidateLayout()
                self.repositoriesCollectionView.reloadData()
            }
        }
    }
}
