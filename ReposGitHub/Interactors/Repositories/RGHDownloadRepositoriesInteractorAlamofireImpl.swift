//
//  RGHDownloadRepositoriesInteractorAlamofireImpl.swift
//  ReposGitHub
//
//  Created by luis gomez alonso on 14/12/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import Alamofire

class RGHDownloadRepositoriesInteractorAlamofireImpl: RGHDownloadRepositoriesInteractor {
    
    var parameters: [String:Any] = [:]
    
    func execute(queryText: String, nextPageParam: String, onSuccess: @escaping (RGHRepositories?) -> Void, onError: errorClosure) {
        //Parameters for url
        if queryText == "" {
            parameters = [
                "q":"is:public",
                "sort":"start",
                "order":"desc",
                "page":"\(nextPageParam)",
                "per_page":"100"]
        } else {
            parameters = [
                "q":"\(queryText) in:name,description is:public",
                "sort":"start",
                "order":"desc",
                "page":"\(nextPageParam)",
                "per_page":"100"]
        }
        
        //Call GitHub API
        Alamofire.request(Constants.urlHost + Constants.urlLoginPath, method: .get, parameters: parameters, encoding: URLEncoding.default, headers: nil).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                //Extract Links from response for paging
                if let linkHeader = response.response?.allHeaderFields["Link"] as? String {
                    nextPage = extractLinkAmpersand(linkHeader: linkHeader)
                }
                activityIndicator.removeFromSuperview()
                do {
                    let repositories = RGHparseRepositories(data: data)
                    onSuccess(repositories)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func execute(queryText: String, nextPageParam: String, onSuccess: @escaping (RGHRepositories?) -> Void) {
        execute(queryText: queryText, nextPageParam: nextPageParam, onSuccess: onSuccess, onError: nil)
    }
}
