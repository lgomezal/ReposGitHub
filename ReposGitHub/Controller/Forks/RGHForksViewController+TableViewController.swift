//
//  RGHForksViewController+TableViewController.swift
//  ReposGitHub
//
//  Created by luis gomez alonso on 18/12/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import UIKit

extension RGHForksViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let forks = self.totalForks?.count() {
            return forks
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = forkTableViewCellId
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! RGHForkCell
        let fork: RGHFork = ((self.totalForks?.get(index: indexPath.row))!)
        cell.refresh(fork: fork, index: indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let totFor = self.totalForks?.count() {
            if (indexPath.row == (totFor) - 1 ) {
                //it's last cell
                if nextUrlForks != "" {
                    hasMorePagesForks = true
                    //Download forks
                    RGHExecuteInteractorImpl().execute {
                        self.forksDownload(forksUrl: nextUrlForks)
                    }
                }
            }
        }
    }
}


