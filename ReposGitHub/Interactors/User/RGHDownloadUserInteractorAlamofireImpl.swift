//
//  RGHDownloadUserInteractorAlamofireImpl.swift
//  ReposGitHub
//
//  Created by luis gomez alonso on 18/12/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import Alamofire

class RGHDownloadUserInteractorAlamofireImpl: RGHDownloadUserInteractor {
    
    func execute(userUrl: String, onSuccess: @escaping (RGHUser?) -> Void, onError: errorClosure) {
        
        //Call GitHub API
        Alamofire.request(userUrl, method: .get, parameters: nil, encoding: URLEncoding.default, headers: nil).validate().responseData { (response) in
            switch response.result {
            case .success(let data):
                activityIndicator.removeFromSuperview()
                do {
                    let decoder = JSONDecoder()
                    let user = try decoder.decode(RGHUser.self, from: data)
                    onSuccess(user)
                } catch {
                    //TODO alert with error
                    onSuccess(nil)
                }
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func execute(userUrl: String, onSuccess: @escaping (RGHUser?) -> Void) {
        execute(userUrl: userUrl, onSuccess: onSuccess, onError: nil)
    }
}
