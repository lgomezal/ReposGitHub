//
//  RGHRepositoriesViewController+SearchController.swift
//  ReposGitHub
//
//  Created by luis gomez alonso on 15/12/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import UIKit

extension RGHRepositoriesViewController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        //Download repositories
        if hasFind {
            RGHExecuteInteractorImpl().execute {
                //Find queryText empty in API
                queryText = ""
                nextPage = ""
                repositoriesDownload(queryText: queryText, nextPageParam: nextPage)
            }
        }
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        let text = searchBar.text
        //Download repositories with searchText
        RGHExecuteInteractorImpl().execute {
            //Find queryText in API
            //Initialize totalRepos
            self.totalRepos = nil
            totalRepos = RGHRepositories()
            queryText = text!
            nextPage = ""
            hasFind = true
            repositoriesDownload(queryText: queryText, nextPageParam: nextPage)
        }
    }
}
