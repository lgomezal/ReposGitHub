//
//  Constants.swift
//  ReposGitHub
//
//  Created by luis gomez alonso on 14/12/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import Foundation

struct Constants {
    //url parameters
    static let urlHost = "https://api.github.com"
    static let urlLoginPath = "/search/repositories"
    //CellsID
    static let repositoryCVCId = "RGHRepositoryCollectionViewCell"
}

struct Parameters {
    let parmsRepFirstTime: [String: Any] = [
        "q":"is:public",
        "sort":"updated",
        "order":"desc",
        "page":"1",
        "per_page":"100"
        ]
}
