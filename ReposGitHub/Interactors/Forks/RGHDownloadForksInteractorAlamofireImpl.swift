//
//  RGHDownloadForksInteractorAlamofireImpl.swift
//  ReposGitHub
//
//  Created by luis gomez alonso on 18/12/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import Foundation
import Alamofire

class RGHDownloadForksInteractorAlamofireImpl: RGHDownloadForksInteractor {
    
    func execute(forksUrl: String, onSuccess: @escaping (RGHForksUsers?) -> Void, onError: errorClosure) {
        
        //Call GitHub API
        Alamofire.request(forksUrl, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                activityIndicator.removeFromSuperview()
                //Extract Links from response for paging
                if let linkHeader = response.response?.allHeaderFields["Link"] as? String {
                    nextUrlForks = extractLink(linkHeader: linkHeader)
                }
                activityIndicator.removeFromSuperview()
                do {
                    let forks = RGHJSONParserFork(data: data)
                    onSuccess(forks)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func execute(forksUrl: String, onSuccess: @escaping (RGHForksUsers?) -> Void) {
        execute(forksUrl: forksUrl, onSuccess: onSuccess, onError: nil)
    }
}

