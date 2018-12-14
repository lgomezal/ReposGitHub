//
//  RGHRepositories.swift
//  ReposGitHub
//
//  Created by luis gomez alonso on 14/12/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import Foundation

protocol RepositoriesProtocol {
    func count() -> Int
    func add(repository: RGHRepository)
    func get(index: Int) -> RGHRepository
}

public class RGHRepositories: RepositoriesProtocol {
    private var repositoriesList: [RGHRepository]?
    
    public init() {
        self.repositoriesList = []
    }
    
    public func count() -> Int {
        return (repositoriesList?.count)!
    }
    
    public func add(repository: RGHRepository) {
        repositoriesList?.append(repository)
    }
    
    public func get(index: Int) -> RGHRepository {
        return (repositoriesList?[index])!
    }
    
}
