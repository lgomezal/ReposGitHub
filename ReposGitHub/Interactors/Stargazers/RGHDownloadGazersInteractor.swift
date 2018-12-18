//
//  RGHDownloadGazersInteractor.swift
//  ReposGitHub
//
//  Created by luis gomez alonso on 18/12/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import Foundation

protocol RGHDownloadGazersInteractor {
    func execute(stargazerUrl: String, onSuccess: @escaping (RGHGazers?) -> Void, onError: errorClosure)
    func execute(stargazerUrl: String, onSuccess: @escaping (RGHGazers?) -> Void)
}

