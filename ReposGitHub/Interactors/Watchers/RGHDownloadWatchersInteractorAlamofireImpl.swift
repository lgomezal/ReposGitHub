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
                    nextUrlWatchers = self.extractLink(linkHeader: linkHeader)
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
    
    func extractLink(linkHeader: String) -> String {
        let links = linkHeader.components(separatedBy: ",")
        
        var dictionary: [String: String] = [:]
        links.forEach({
            let components = $0.components(separatedBy:"; ")
            let cleanPath = components[0].trimmingCharacters(in: CharacterSet(charactersIn: "<>"))
            let cleanPath2 = cleanPath.trimmingCharacters(in: CharacterSet(charactersIn: " <"))
            dictionary[components[1]] = cleanPath2
        })
        
        if let nextPagePath = dictionary["rel=\"next\""] {
            return nextPagePath
        } else {
            return ""
        }
    }
}

