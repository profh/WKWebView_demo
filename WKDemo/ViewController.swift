//
//  ViewController.swift
//  WKDemo
//
//  Created by Larry Heimann on 10/12/15.
//  Copyright (c) 2015 Larry Heimann. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
  
  var webView: WKWebView!
  
  override func loadView() {
    super.loadView()
    webView = WKWebView()
    webView.navigationDelegate = self // basically "if any web page nav happens, tell me"
    view = webView
  }

  override func viewDidLoad() {
    super.viewDidLoad()
    // handle the starting URL for the webView
    let url = NSURL(string: "https://www.twitter.com/profh")
    webView.loadRequest(NSURLRequest(URL: url!))
    webView.allowsBackForwardNavigationGestures = true
    
    // set up the open button programmatically
    navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Open", style: .Plain, target: self, action: "openTapped")
    navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Refresh, target: webView, action: "reload")
  }
  
  func openTapped() {
    let ac = UIAlertController(title: "Open page…", message: nil, preferredStyle: .ActionSheet)
    ac.addAction(UIAlertAction(title: "www.twitter.com/profh", style: .Default, handler: openPage))
    ac.addAction(UIAlertAction(title: "67442.cmuis.net", style: .Default, handler: openPage))
    ac.addAction(UIAlertAction(title: "patriots.com", style: .Default, handler: openPage))
    ac.addAction(UIAlertAction(title: "Cancel", style: .Cancel, handler: nil))
    presentViewController(ac, animated: true, completion: nil)
  }
  
  func openPage(action: UIAlertAction!) {
    let url = NSURL(string: "http://" + action.title)!
    webView.loadRequest(NSURLRequest(URL: url))
  }
  
  func refreshTapped() {
    webView.reload()
  }
  
  func webView(webView: WKWebView, didFinishNavigation navigation: WKNavigation!) {
    title = webView.title
  }

  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }

}

