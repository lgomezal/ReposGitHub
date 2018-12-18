//
//  RGHDownloadUserInteractor.swift
//  ReposGitHub
//
//  Created by luis gomez alonso on 18/12/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import Foundation

protocol RGHDownloadUserInteractor {
    func execute(userUrl: String, onSuccess: @escaping (RGHUser?) -> Void, onError: errorClosure)
    func execute(userUrl: String, onSuccess: @escaping (RGHUser?) -> Void)
}
