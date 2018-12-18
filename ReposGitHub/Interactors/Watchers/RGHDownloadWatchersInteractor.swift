//
//  RGHDownloadWatchersInteractor.swift
//  ReposGitHub
//
//  Created by luis gomez alonso on 18/12/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import Foundation

protocol RGHDownloadWatchersInteractor {
    func execute(watcherUrl: String, onSuccess: @escaping (RGHWatchersUsers?) -> Void, onError: errorClosure)
    func execute(watcherUrl: String, onSuccess: @escaping (RGHWatchersUsers?) -> Void)
}

