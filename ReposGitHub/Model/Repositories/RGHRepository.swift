//
//  RGHRepository.swift
//  ReposGitHub
//
//  Created by luis gomez alonso on 14/12/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import Foundation

struct RGHResponseRepository: Codable {
    let total_count: Int
    let incomplete_results: Bool
    let items: [RGHRepository]
}

public struct RGHRepository: Codable {
    
    let name: String
    let fullName: String
    let description: String?
    let owner: RGHOwner?
    let language: String?
    let license: RGHLicense?
    let stargazersCount: Int?
    let updatedAt: Date?
    
    enum CodingKeys: String, CodingKey
    {
        case name
        case fullName = "full_name"
        case description
        case owner
        case language
        case license
        case stargazersCount = "stargazers_count"
        case updatedAt = "updated_at"
    }
    
    init(name: String, fullName: String, description: String?, owner: RGHOwner, language: String?, license: RGHLicense?, stargazersCount: Int?, updatedAt: Date?) {
        self.name = name
        self.fullName = fullName
        self.description = description
        self.owner = owner
        self.language = language
        self.license = license
        self.stargazersCount = stargazersCount
        self.updatedAt = updatedAt
    }
    
}

struct RGHOwner: Codable {
    let avatar_url: String
}

struct RGHLicense: Codable {
    let key: String
    let name: String
}

// Mark: - Proxy
extension RGHRepository {
    var proxyForEquality: String {
        return "\(name) \(fullName) \(description)"
    }
    
    var proxyForComparison: String {
        return name.uppercased()
    }
}

// Mark: - Equatable
extension RGHRepository: Equatable {
    public static func ==(lhs: RGHRepository, rhs: RGHRepository) -> Bool {
        return lhs.proxyForEquality == rhs.proxyForEquality
    }
}

//MARK: - Comparable
extension RGHRepository: Comparable {
    public static func <(lhs: RGHRepository, rhs: RGHRepository) -> Bool {
        return lhs.proxyForComparison < rhs.proxyForComparison
    }
    
    
}
