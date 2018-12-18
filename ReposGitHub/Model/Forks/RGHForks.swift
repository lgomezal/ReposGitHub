//
//  RGHForks.swift
//  ReposGitHub
//
//  Created by luis gomez alonso on 18/12/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import Foundation

public struct RGHForks: Codable {
    let items: [RGHFork]
}

public struct RGHFork: Codable {
    let owner: RGHOwner
}
