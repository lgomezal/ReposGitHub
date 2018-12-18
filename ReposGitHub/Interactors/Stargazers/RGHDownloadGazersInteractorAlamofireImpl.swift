//
//  RGHDownloadGazersInteractorAlamofireImpl.swift
//  ReposGitHub
//
//  Created by luis gomez alonso on 18/12/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import Alamofire

class RGHDownloadGazersInteractorAlamofireImpl: RGHDownloadGazersInteractor {
    
    func execute(stargazerUrl: String, onSuccess: @escaping (RGHGazers?) -> Void, onError: errorClosure) {
        
        //Call GitHub API
        Alamofire.request(stargazerUrl, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                activityIndicator.removeFromSuperview()
                //Extract Links from response for paging
                if let linkHeader = response.response?.allHeaderFields["Link"] as? String {
                    nextUrlStargazers = extractLink(linkHeader: linkHeader)
                }
                activityIndicator.removeFromSuperview()
                do {
                    let gazers = RGHJSONParserStargazer(data: data)
                    onSuccess(gazers)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func execute(stargazerUrl: String, onSuccess: @escaping (RGHGazers?) -> Void) {
        execute(stargazerUrl: stargazerUrl, onSuccess: onSuccess, onError: nil)
    }
}
