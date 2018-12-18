//
//  RGHWatchersViewController+TableViewController.swift
//  ReposGitHub
//
//  Created by luis gomez alonso on 18/12/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import UIKit

extension RGHWatchersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if let watchers = self.totalWatchers?.count() {
            return watchers
        }
        return 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifier = watcherTableViewCellId
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath) as! RGHWatcherCell
        let watcher: RGHWatcher = ((self.totalWatchers?.get(index: indexPath.row))!)
        cell.refresh(watcher: watcher, index: indexPath.row)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, willDisplay cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        if let totWat = self.totalWatchers?.count() {
            if (indexPath.row == (totWat) - 1 ) {
                //it's last cell
                if nextUrlWatchers != "" {
                    hasMorePagesWatchers = true
                    //Download watchers
                    RGHExecuteInteractorImpl().execute {
                        self.watchersDownload(watcherUrl: nextUrlWatchers)
                    }
                }
            }
        }
    }
}

