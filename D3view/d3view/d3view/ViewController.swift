//
//  ViewController.swift
//  d3view
//
//  Created by ggc on 3/1/16.
//  Copyright © 2016 ggc. All rights reserved.
//
//https://github.com/vsouza/awesome-ios#button
//
//https://github.com/Guidebook/gbkui-button-progress-view
//
//https://github.com/marmelroy/TVButton
//
//https://github.com/0x73/SDevCircleButton
//
//https://github.com/StyleShare/SSBouncyButton
//


import UIKit
import SSBouncyButton


class ViewController: UIViewController {

    @IBOutlet weak var webViewer: UIWebView!
    @IBOutlet weak var openButton: SSBouncyButton!
    @IBAction func buttonDidTap(sender: SSBouncyButton) {
        
        sender.selected = !sender.selected
        
        self.loadPage("http://localhost:5000/");
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor(red: 242/255, green: 242/255, blue: 242/255, alpha: 1)
        openButton.cornerRadius = 5
        openButton.setTitle("Open", forState: .Normal)
        openButton.setTitle("Opened", forState: .Selected)
        
        
        self.webViewer.delegate = self
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    
    func loadPage(url:String) {
        let requestURL = NSURL(string:url)
        let request = NSURLRequest(URL: requestURL!)
        webViewer.loadRequest(request)
    }
}

extension ViewController: UIWebViewDelegate {
    

    func testFunc() {
        self.view.backgroundColor = UIColor().getRandomColor(0.8)
    }
    
    
    func webView(webView: UIWebView, shouldStartLoadWithRequest request: NSURLRequest, navigationType: UIWebViewNavigationType) -> Bool {
        
        
        let urlString = request.URL!
        print("\(request.URL)")
        if urlString.scheme == "ggc" {
            self.testFunc()
            return false;
        }
        return true;
    }
}

