//
//  RGHExecuteInteractorImpl.swift
//  ReposGitHub
//
//  Created by luis gomez alonso on 14/12/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import Foundation

class RGHExecuteInteractorImpl: RGHExecuteInteractor {
    func execute(closure: () -> Void) {
        closure()
    }
}
