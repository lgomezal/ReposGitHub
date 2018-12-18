//
//  RGHStargazer.swift
//  ReposGitHub
//
//  Created by luis gomez alonso on 18/12/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import Foundation

public struct RGHStargazers: Codable {
    let items: [RGHStargazer]
}

public struct RGHStargazer: Codable {
    let login: String
    let avatarUrl: String?
    
    enum CodingKeys: String, CodingKey
    {
        case login
        case avatarUrl = "avatar_url"
    }
}
