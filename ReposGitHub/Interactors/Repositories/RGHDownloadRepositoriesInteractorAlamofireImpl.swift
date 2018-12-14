//
//  RGHDownloadRepositoriesInteractorAlamofireImpl.swift
//  ReposGitHub
//
//  Created by luis gomez alonso on 14/12/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import Alamofire

class RGHDownloadRepositoriesInteractorAlamofireImpl: RGHDownloadRepositoriesInteractor {
    
    func execute(onSuccess: @escaping (RGHRepositories?) -> Void, onError: errorClosure) {
        
        //Call GitHub API
        Alamofire.request(Constants.urlHost + Constants.urlLoginPath, method: .get, parameters: ["q":"is:public","sort":"start","order":"desc",                     "page":"1","per_page":"100"], encoding: URLEncoding.default, headers: nil).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
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
    
    func execute(onSuccess: @escaping (RGHRepositories?) -> Void) {
        execute(onSuccess: onSuccess, onError: nil)
    }
}
