//
//  ViewController.swift
//  WebViewiOS
//
//  Created by Ashish on 2019-07-17.
//  Copyright © 2019 Richu. All rights reserved.
//

import UIKit
import WebKit
class ViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webViewKit: WKWebView!
    @IBOutlet weak var homeButton: UIBarButtonItem!
    override func viewDidLoad() {
        super.viewDidLoad()
        webViewKit.navigationDelegate = self
        webViewKit.allowsBackForwardNavigationGestures = true
        // Do any additional setup after loading the view.
        //self.loadFromString()
        self.loadFromUrl()
        //self.loadFromFile()
    }
    
    @IBAction func toolbarAction(_ sender: UIBarButtonItem) {
        switch sender.tag {
        case 0 :
            webViewKit.reloadFromOrigin()
        case 1 :
            if webViewKit.canGoForward{
                webViewKit.goForward()
            }
        case 2 :
            if webViewKit.canGoBack{
                webViewKit.goBack()
            }
        default: print("Nothing")
        }
    }

    func loadFromString(){
        let htmlString = """
        
<h1>Hello World</h1>
<h2>Hello World</h2>
<h3>Hello World</h3>
<h4>Hello World</h4>
<h5>Hello World</h5>
<h6>Hello World</h6>
"""
        webViewKit.loadHTMLString(htmlString, baseURL: nil)
    }
    func loadFromUrl(){
        let url = URL(string: "https://www.youtube.com/watch?v=px317izkJ6w")
        let urlReq = URLRequest(url: url!)
        webViewKit.load(urlReq)
    }
    
    func loadFromFile(){
        let localFilePath = Bundle.main.url(forResource: "helloworld", withExtension: "html")
        let myRequest = URLRequest(url: localFilePath!)
        webViewKit.load(myRequest)
        
    }


}

