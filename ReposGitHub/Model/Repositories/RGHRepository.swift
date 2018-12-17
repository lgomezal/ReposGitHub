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
    let forksCount: Int?
    let issuesCount: Int?
    let size: Int?
    let updatedAt: Date?
    let createdAt: Date?
    let forksUrl: String?
    let stargazersUrl: String?
    let subscribersUrl: String?
    let sourceUrl: String?
    let homepage: String?
    
    enum CodingKeys: String, CodingKey
    {
        case name
        case fullName = "full_name"
        case description
        case owner
        case language
        case license
        case stargazersCount = "stargazers_count"
        case forksCount = "forks_count"
        case issuesCount = "open_issues_count"
        case size
        case updatedAt = "updated_at"
        case createdAt = "created_at"
        case forksUrl = "forks_url"
        case stargazersUrl = "stargazers_url"
        case subscribersUrl = "subscribers_url"
        case sourceUrl = "html_url"
        case homepage
    }
    
    init(name: String, fullName: String, description: String?, owner: RGHOwner, language: String?, license: RGHLicense?, stargazersCount: Int?, forksCount: Int?, issuesCount: Int?, size: Int?, updatedAt: Date?, createdAt: Date?, forksUrl: String?, stargazersUrl: String?, subscribersUrl: String?, sourceUrl: String?, homepage: String?) {
        self.name = name
        self.fullName = fullName
        self.description = description
        self.owner = owner
        self.language = language
        self.license = license
        self.stargazersCount = stargazersCount
        self.forksCount = forksCount
        self.issuesCount = issuesCount
        self.size = size
        self.updatedAt = updatedAt
        self.createdAt = createdAt
        self.forksUrl = forksUrl
        self.stargazersUrl = stargazersUrl
        self.subscribersUrl = subscribersUrl
        self.sourceUrl = sourceUrl
        self.homepage = homepage
    }
    
}

struct RGHOwner: Codable {
    let login: String
    let avatar_url: String
    let url: String
}

struct RGHLicense: Codable {
    let key: String
    let name: String
}

// Mark: - Proxy
extension RGHRepository {
    var proxyForEquality: String {
        return "\(name) \(fullName) \(String(describing: description))"
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
