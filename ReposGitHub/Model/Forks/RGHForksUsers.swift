//
//  RGHForksUsers.swift
//  ReposGitHub
//
//  Created by luis gomez alonso on 18/12/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import Foundation

protocol ForksUsersProtocol {
    func count() -> Int
    func add(fork: RGHFork)
    func get(index: Int) -> RGHFork
}

public class RGHForksUsers: ForksUsersProtocol {
    private var forksList: [RGHFork]?
    
    public init() {
        self.forksList = []
    }
    
    public func count() -> Int {
        return (forksList?.count)!
    }
    
    public func add(fork: RGHFork) {
        forksList?.append(fork)
    }
    
    public func get(index: Int) -> RGHFork {
        return (forksList?[index])!
    }
    
}
