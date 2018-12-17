//
//  RGHDownloadReadmeInteractor.swift
//  ReposGitHub
//
//  Created by luis gomez alonso on 17/12/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import Foundation

protocol RGHDownloadReadmeInteractor {
    func execute(owner: String, repositoryName: String, onSuccess: @escaping (RGHReadme?) -> Void, onError: errorClosure)
    func execute(owner: String, repositoryName: String, onSuccess: @escaping (RGHReadme?) -> Void)
}

