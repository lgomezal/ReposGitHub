//
//  RGHUser.swift
//  ReposGitHub
//
//  Created by luis gomez alonso on 18/12/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import Foundation

struct RGHUser: Codable {
    let name: String?
    let avatarUrl: String?
    let publicRepos: Int?
    let location: String?
    let followers: Int?
    let following: Int?
    
    enum CodingKeys: String, CodingKey
    {
        case name
        case avatarUrl = "avatar_url"
        case publicRepos = "public_repos"
        case location
        case followers
        case following
    }
}

