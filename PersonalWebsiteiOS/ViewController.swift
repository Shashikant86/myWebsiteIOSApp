//
//  ViewController.swift
//  PersonalWebsiteiOS
//
//  Created by Shashikant Jagtap on 28/05/2016.
//  Copyright © 2016 Shashikant Jagtap. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var webView: UIWebView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let url = NSURL(string: "http://shashikantjagtap.net")!
        
//        webView.loadRequest(NSURLRequest(URL: url))

        let task = NSURLSession.sharedSession().dataTaskWithURL(url) { (data, response, error) -> Void in
            
            if let urlContent = data {
                
                
                let webContent = NSString(data: urlContent, encoding: NSUTF8StringEncoding)
                
                
                
                dispatch_async(dispatch_get_main_queue(), { () -> Void in
                    self.webView.loadHTMLString(String(webContent!), baseURL: nil)
                })
                
            } else {
                
                //error message
            }
            
            
        }
        
        task.resume()
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

