//
//  RGHJSONParserWatcher.swift
//  ReposGitHub
//
//  Created by luis gomez alonso on 18/12/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import Foundation

func RGHJSONParserWatcher(data: Data) -> RGHWatchersUsers {
    let watchers = RGHWatchersUsers()
    
    do {
        //Create custom decoder to treat the date field that may be invalid
        let decoder = JSONDecoder()
        let jsonData = try decoder.decode(Array<RGHWatcher>.self, from: data)
        let result = jsonData
        for watcher in result {
            watchers.add(watcher: watcher)
        }
    } catch let parsingError {
        activityIndicator.removeFromSuperview()
        print(parsingError)
    }
    return watchers
}

