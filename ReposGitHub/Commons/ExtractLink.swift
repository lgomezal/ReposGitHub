//
//  ExtractLink.swift
//  ReposGitHub
//
//  Created by luis gomez alonso on 18/12/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import UIKit

func extractLinkAmpersand(linkHeader: String) -> String {
    let links = linkHeader.components(separatedBy: ",")
    
    var dictionary: [String: String] = [:]
    links.forEach({
        let components = $0.components(separatedBy:"; ")
        let cleanPath = components[0].trimmingCharacters(in: CharacterSet(charactersIn: "<>"))
        let cleanPath2 = cleanPath.trimmingCharacters(in: CharacterSet(charactersIn: " <"))
        dictionary[components[1]] = cleanPath2
    })
    
    if let nextPagePath = dictionary["rel=\"next\""] {
        print("nextPagePath: \(nextPagePath)")
        let ampersand = nextPagePath.components(separatedBy: "&")
        let nextPage = ampersand[1].trimmingCharacters(in: CharacterSet(charactersIn: "page="))
        return nextPage
    } else {
        return ""
    }
}

func extractLink(linkHeader: String) -> String {
    let links = linkHeader.components(separatedBy: ",")
    
    var dictionary: [String: String] = [:]
    links.forEach({
        let components = $0.components(separatedBy:"; ")
        let cleanPath = components[0].trimmingCharacters(in: CharacterSet(charactersIn: "<>"))
        let cleanPath2 = cleanPath.trimmingCharacters(in: CharacterSet(charactersIn: " <"))
        dictionary[components[1]] = cleanPath2
    })
    
    if let nextPagePath = dictionary["rel=\"next\""] {
        return nextPagePath
    } else {
        return ""
    }
}
