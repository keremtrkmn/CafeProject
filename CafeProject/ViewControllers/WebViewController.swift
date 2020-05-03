//
//  WebViewController.swift
//  CafeProject
//
//  Created by Appendix on 3.05.2020.
//  Copyright © 2020 Appendix. All rights reserved.
//

import UIKit
import WebKit

class WebViewController: UIViewController, UIWebViewDelegate{
    
    //MARK: Outlet
    
    @IBOutlet weak var webView: UIWebView!
    @IBOutlet weak var errorLabel: UILabel!
    @IBOutlet weak var loadSpinner: UIActivityIndicatorView!
    
    //MARK: Properties
    
    var webUrl = ""
    
    func loadAddress() {
        let myUrl = URL(string: "https://\(webUrl)")
        webView.loadRequest(URLRequest(url: myUrl!))
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.delegate = self
        loadAddress()
    }
    
    func webView(_ webView: UIWebView, didFailLoadWithError error: Error) {
        errorLabel.isHidden = false
        loadSpinner.stopAnimating()
        loadSpinner.isHidden = true
    }
    
    func webViewDidStartLoad(_ webView: UIWebView) {
        loadSpinner.startAnimating()
        loadSpinner.isHidden = false
    }
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        loadSpinner.stopAnimating()
        loadSpinner.isHidden = true
    }

}
