//
//  RGHSourceController.swift
//  ReposGitHub
//
//  Created by luis gomez alonso on 17/12/2018.
//  Copyright © 2018 luis gomez alonso. All rights reserved.
//

import UIKit
import WebKit

class RGHSourceController: UIViewController {
    
    var repository: RGHRepository?

    @IBOutlet weak var webView: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Source"
        
        //If homepage show this
        if let url: URL = URL(string: ((self.repository?.sourceUrl)!)) {
            self.webView.load(URLRequest(url: url))
        }
    }
}
