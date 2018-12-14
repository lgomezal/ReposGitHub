//
//  RGHJSONParserRepository.swift
//  ReposGitHub
//
//  Created by luis gomez alonso on 14/12/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import Foundation

func RGHparseRepositories(data: Data) -> RGHRepositories {
    let repositories = RGHRepositories()
    
    do {
        //Create custom decoder to treat the date field that may be invalid
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .custom({ (decoder) -> Date in
            let dateISO8601 = DateFormatter()
            dateISO8601.dateFormat = "yyyy-MM-dd'T'HH:mm:SSZ"
            let container = try decoder.singleValueContainer()
            let dateStr = try container.decode(String.self)
            var tmpDate: Date? = nil
            tmpDate = dateISO8601.date(from: dateStr)
            
            guard let date = tmpDate else {
                let dateInit = Date.init(timeIntervalSince1970: 86399)
                return dateInit
            }
            return date
        })
        let jsonData = try decoder.decode(RGHResponseRepository.self, from: data)
        let result = jsonData.items
        for repository in result {
            repositories.add(repository: repository)
        }
    } catch let parsingError {
        activityIndicator.removeFromSuperview()
        print(parsingError)
    }
    return repositories
}
