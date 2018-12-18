//
//  RGHDownloadForksInteractor.swift
//  ReposGitHub
//
//  Created by luis gomez alonso on 18/12/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import Foundation

protocol RGHDownloadForksInteractor {
    func execute(forksUrl: String, onSuccess: @escaping (RGHForksUsers?) -> Void, onError: errorClosure)
    func execute(forksUrl: String, onSuccess: @escaping (RGHForksUsers?) -> Void)
}
