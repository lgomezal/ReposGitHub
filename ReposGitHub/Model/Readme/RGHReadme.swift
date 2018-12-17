//
//  RGHReadme.swift
//  ReposGitHub
//
//  Created by luis gomez alonso on 17/12/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import Foundation

struct RGHReadme: Codable {
    let name: String
    let path: String
    let htmlUrl: String
    
    enum CodingKeys: String, CodingKey
    {
        case name
        case path
        case htmlUrl = "html_url"
    }
}
