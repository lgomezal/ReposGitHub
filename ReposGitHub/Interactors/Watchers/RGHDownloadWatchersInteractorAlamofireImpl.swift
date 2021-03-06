//
//  RGHDownloadWatchersInteractorAlamofireImpl.swift
//  ReposGitHub
//
//  Created by luis gomez alonso on 18/12/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import Foundation
import Alamofire

class RGHDownloadWatchersInteractorAlamofireImpl: RGHDownloadWatchersInteractor {
    
    func execute(watcherUrl: String, onSuccess: @escaping (RGHWatchersUsers?) -> Void, onError: errorClosure) {
        
        //Call GitHub API
        Alamofire.request(watcherUrl, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                activityIndicator.removeFromSuperview()
                //Extract Links from response for paging
                if let linkHeader = response.response?.allHeaderFields["Link"] as? String {
                    nextUrlWatchers = extractLink(linkHeader: linkHeader)
                }
                activityIndicator.removeFromSuperview()
                do {
                    let watchers = RGHJSONParserWatcher(data: data)
                    onSuccess(watchers)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func execute(watcherUrl: String, onSuccess: @escaping (RGHWatchersUsers?) -> Void) {
        execute(watcherUrl: watcherUrl, onSuccess: onSuccess, onError: nil)
    }
}

