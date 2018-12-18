//
//  RGHWatchersUsers.swift
//  ReposGitHub
//
//  Created by luis gomez alonso on 18/12/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import Foundation

protocol WatchersUsersProtocol {
    func count() -> Int
    func add(watcher: RGHWatcher)
    func get(index: Int) -> RGHWatcher
}

public class RGHWatchersUsers: WatchersUsersProtocol {
    private var watchersList: [RGHWatcher]?
    
    public init() {
        self.watchersList = []
    }
    
    public func count() -> Int {
        return (watchersList?.count)!
    }
    
    public func add(watcher: RGHWatcher) {
        watchersList?.append(watcher)
    }
    
    public func get(index: Int) -> RGHWatcher {
        return (watchersList?[index])!
    }
    
}
