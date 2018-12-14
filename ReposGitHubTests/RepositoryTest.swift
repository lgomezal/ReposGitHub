//
//  RepositoryTest.swift
//  RepositoryTest
//
//  Created by luis gomez alonso on 14/12/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import XCTest
@testable import ReposGitHub

class RepositoryTest: XCTestCase {

    var repo1Owner: RGHOwner!
    var repo2Owner: RGHOwner!
    var repo1License: RGHLicense!
    var repo2License: RGHLicense!
    
    var repo1Repository: RGHRepository!
    var repo2Repository: RGHRepository!
    
    override func setUp() {
        super.setUp()
        repo1Owner = RGHOwner(avatar_url: "avatar1")
        repo2Owner = RGHOwner(avatar_url: "avatar2")
        repo1License = RGHLicense(key: "1", name: "license1")
        repo2License = RGHLicense(key: "2", name: "license2")
        
        repo1Repository = RGHRepository(name: "repo1", fullName: "test/repo1", description: "description", owner: repo1Owner, language: "Swift", license: repo1License, stargazersCount: 1, updatedAt: Date())
        repo2Repository = RGHRepository(name: "repo2", fullName: "test/repo2", description: "description", owner: repo2Owner, language: "Swift", license: repo2License, stargazersCount: 2, updatedAt: Date())
        
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testRepositoryExistence() {
        XCTAssertNotNil(repo1Repository)
    }
    
    func testOwnerExistence() {
        XCTAssertNotNil(repo1Owner)
        XCTAssertNotNil(repo2Owner)
    }
    
    func testLicenseExistence() {
        XCTAssertNotNil(repo1License)
        XCTAssertNotNil(repo2License)
    }
    
    func testAddRepositories() {
        
        let repositoriesList = RGHRepositories.init()
        
        XCTAssertEqual(repositoriesList.count(), 0)
        repositoriesList.add(repository: repo1Repository)
        
        XCTAssertEqual(repositoriesList.count(), 1)
        repositoriesList.add(repository: repo2Repository)
        
        XCTAssertEqual(repositoriesList.count(), 2)
        
    }
    
    func testRepositoryEquality() {
        let repo1Repository = RGHRepository(name: "repo1", fullName: "test/repo1", description: "description", owner: repo1Owner, language: "Swift", license: repo1License, stargazersCount: 1, updatedAt: Date())
        // Identity
        XCTAssertEqual(repo1Repository, repo1Repository)
        
        let repo2Repository = RGHRepository(name: "repo2", fullName: "test/repo2", description: "description", owner: repo2Owner, language: "Swift", license: repo2License, stargazersCount: 2, updatedAt: Date())
        // inequality
        XCTAssertNotEqual(repo1Repository, repo2Repository)
    }
    
    func testRepositoryComparison() {
        XCTAssertLessThan(repo1Repository, repo2Repository)
    }
}
