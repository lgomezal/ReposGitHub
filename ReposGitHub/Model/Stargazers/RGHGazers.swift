//
//  RGHGazers.swift
//  ReposGitHub
//
//  Created by luis gomez alonso on 18/12/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import Foundation

protocol GazersProtocol {
    func count() -> Int
    func add(stargazer: RGHStargazer)
    func get(index: Int) -> RGHStargazer
}

public class RGHGazers: GazersProtocol {
    private var gazersList: [RGHStargazer]?
    
    public init() {
        self.gazersList = []
    }
    
    public func count() -> Int {
        return (gazersList?.count)!
    }
    
    public func add(stargazer: RGHStargazer) {
        gazersList?.append(stargazer)
    }
    
    public func get(index: Int) -> RGHStargazer {
        return (gazersList?[index])!
    }
    
}

