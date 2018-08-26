//
//  togaminViewController.swift
//  Qmin
//
//  Created by Togami Yuki on 2018/08/26.
//  Copyright © 2018 Togami Yuki. All rights reserved.
//

import UIKit
import WebKit

class togaminViewController: UIViewController {

    @IBOutlet weak var togaminWebKitView: WKWebView!
    @IBOutlet weak var progressView: UIProgressView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //監視の設定(progressView)
        self.togaminWebKitView.addObserver(self, forKeyPath: "loading", options: .new, context: nil)
        self.togaminWebKitView.addObserver(self, forKeyPath: "estimatedProgress", options: .new, context: nil)
        
        if let url = URL(string:"https://togamin.com/"){
            let request = URLRequest(url:url)
            self.togaminWebKitView.load(request)
        }
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?, change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress"{
            //estimatedProgressが変更されたときに、setProgressを使ってプログレスバーの値を変更する。
            self.progressView.setProgress(Float(self.togaminWebKitView.estimatedProgress), animated: true)
        }else if keyPath == "loading"{
            UIApplication.shared.isNetworkActivityIndicatorVisible = self.togaminWebKitView.isLoading
            if self.togaminWebKitView.isLoading {
                self.progressView.setProgress(0.1, animated: true)
            }else{
                //読み込みが終わったら0に
                self.progressView.setProgress(0.0, animated: false)
            }
        }
    }
    @IBAction func shareBlog(_ sender: UIBarButtonItem) {
        let controller = UIActivityViewController(activityItems: [URL(string: "https://togamin.com/")], applicationActivities:nil)
        self.present(controller, animated: true,completion:nil)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

}
