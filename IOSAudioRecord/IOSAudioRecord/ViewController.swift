//
//  ViewController.swift
//  IOSAudioRecord
//
//  Created by Suleman Ali on 24/08/2022.
//

import UIKit
import WebKit
class ViewController: UIViewController {

    var webView : WKWebView!
    let activityIndicator = UIActivityIndicatorView(style: .whiteLarge)
    
    override func viewDidLoad() {
        super.viewDidLoad()
            // Do any additional setup after loading the view.
        activityIndicator.startAnimating()
        webView = WKWebView()
        
        
        
        
        webView.navigationDelegate = self
        self.view = webView
        
        do {
            guard let filePath = Bundle.main.path(forResource: "index", ofType: "html")
            else {
                print ("File reading error")
                return
            }
            
            let contents =  try String(contentsOfFile: filePath, encoding: .utf8)
            let baseUrl = URL(fileURLWithPath: filePath)
            webView.loadHTMLString(contents as String, baseURL: baseUrl)
        }
        catch {
            print ("File HTML error")
        }
        
        activityIndicator.stopAnimating()
        webView.allowsBackForwardNavigationGestures = true
        webView.configuration.allowsInlineMediaPlayback = true
        
        
    }
}


extension ViewController : WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        activityIndicator.startAnimating()
    }
    
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        activityIndicator.stopAnimating()
    }


}

