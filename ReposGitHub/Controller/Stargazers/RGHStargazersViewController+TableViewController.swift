//
//  RGHStargazersViewController+TableViewController.swift
//  ReposGitHub
//
//  Created by luis gomez alonso on 18/12/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import UIKit

extension RGHStargazersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let gazers = self.totalGazers?.count() {
            return gazers
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = stargazerTableViewCellId
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! RGHStargazerCell
        let stargazer: RGHStargazer = ((self.totalGazers?.get(index: indexPath.row))!)
        cell.refresh(stargazer: stargazer, index: indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let totGaz = self.totalGazers?.count() {
            if (indexPath.row == (totGaz) - 1 ) {
                //it's last cell
                if nextUrlStargazers != "" {
                    hasMorePagesStargazers = true
                    //Download stargazers
                    RGHExecuteInteractorImpl().execute {
                        self.gazersDownload(stargazerUrl: nextUrlStargazers)
                    }
                }
            }
        }
    }
}
