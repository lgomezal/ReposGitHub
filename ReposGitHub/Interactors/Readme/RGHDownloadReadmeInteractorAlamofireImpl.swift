//
//  RGHDownloadReadmeInteractorAlamofireImpl.swift
//  ReposGitHub
//
//  Created by luis gomez alonso on 17/12/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import Alamofire

class RGHDownloadReadmeInteractorAlamofireImpl: RGHDownloadReadmeInteractor {
    
    var parameters: [String:Any] = [:]
    
    func execute(owner: String, repositoryName: String, onSuccess: @escaping (RGHReadme?) -> Void, onError: errorClosure) {
        
        //Call GitHub API
        let urlPath = "\(Constants.urlReposPath)/\(owner)/\(repositoryName)\(Constants.urlReadmePath)"
        Alamofire.request(Constants.urlHost + urlPath, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                activityIndicator.removeFromSuperview()
                do {
                    let decoder = JSONDecoder()
                    let readme = try decoder.decode(RGHReadme.self, from: data)
                    onSuccess(readme)
                } catch {
                    //TODO alert with error
                    onSuccess(nil)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func execute(owner: String, repositoryName: String, onSuccess: @escaping (RGHReadme?) -> Void) {
        execute(owner: owner, repositoryName: repositoryName, onSuccess: onSuccess, onError: nil)
    }
}
