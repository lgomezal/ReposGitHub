//
//  RGHJSONParserFork.swift
//  ReposGitHub
//
//  Created by luis gomez alonso on 18/12/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import Foundation

func RGHJSONParserFork(data: Data) -> RGHForksUsers {
    let forks = RGHForksUsers()
    
    do {
        //Create custom decoder to treat the date field that may be invalid
        let decoder = JSONDecoder()
        let jsonData = try decoder.decode(Array<RGHFork>.self, from: data)
        let result = jsonData
        for fork in result {
            forks.add(fork: fork)
        }
    } catch let parsingError {
        activityIndicator.removeFromSuperview()
        print(parsingError)
    }
    return forks
}

