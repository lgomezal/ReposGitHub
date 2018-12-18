//
//  RGHJSONParserStargazer.swift
//  ReposGitHub
//
//  Created by luis gomez alonso on 18/12/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import Foundation

func RGHJSONParserStargazer(data: Data) -> RGHGazers {
    let gazers = RGHGazers()
    
    do {
        //Create custom decoder to treat the date field that may be invalid
        let decoder = JSONDecoder()
        let jsonData = try decoder.decode(Array<RGHStargazer>.self, from: data)
        let result = jsonData
        for stargazer in result {
            gazers.add(stargazer: stargazer)
        }
    } catch let parsingError {
        activityIndicator.removeFromSuperview()
        print(parsingError)
    }
    return gazers
}
