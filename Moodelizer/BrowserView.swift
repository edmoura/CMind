//
//  BrowserView.swift
//  Moodelizer
//
//  Created by Edson iMAC on 15/12/2018.
//Copyright © 2018 Edson Moura. All rights reserved.
//

import UIKit
import Viperit
import WebKit

//MARK: BrowserView Class
final class BrowserView: UserInterface {
    
    @IBOutlet weak var webView: WKWebView!
    @IBOutlet weak var progressView: UIProgressView!
    @IBOutlet weak var navTitle: UILabel!
    
    @IBAction func buttonClose(_ sender: Any) {
        presenter.buttonClose()
    }
}

//MARK: - BrowserView API
extension BrowserView: BrowserViewApi {
    func configWebView() {
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        self.webView.navigationDelegate = self
        self.progressView.alpha = 0
        self.navTitle.alpha = 0
    }
    
    func webViewLoadRequest(url: String?) {
        let _url = URL(string: url ?? "")
        let request = URLRequest(url: _url!)
        webView.load(request)
    }
    
    func addObserver() {
        webView.addObserver(self,
                            forKeyPath: #keyPath(WKWebView.estimatedProgress),
                            options: .new,
                            context: nil)
        
        webView.addObserver(self,
                            forKeyPath: #keyPath(WKWebView.title),
                            options: .new,
                            context: nil)
    }
    
    func removeObserver() {
        webView.removeObserver(self, forKeyPath: "title")
        webView.removeObserver(self, forKeyPath: "estimatedProgress")
    }
    
    func showProgressView() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            self.progressView.alpha = 1
        }, completion: nil)
    }
    
    func hideProgressView() {
        UIView.animate(withDuration: 0.5, delay: 0, options: .curveEaseInOut, animations: {
            self.progressView.alpha = 0
        }, completion: nil)
    }
    
    override func observeValue(forKeyPath keyPath: String?, of object: Any?,
                               change: [NSKeyValueChangeKey : Any]?, context: UnsafeMutableRawPointer?) {
        if keyPath == "estimatedProgress" {
            if let progress = (change?[NSKeyValueChangeKey.newKey] as AnyObject).floatValue {
                progressView.progress = progress;
            }
            return
        }
        if keyPath == "title" {
            if let title = change?[NSKeyValueChangeKey.newKey] as? String {
                self.navTitle.text = title
                if self.navTitle.alpha == 0 {
                    UIView.animate(withDuration: 0.5) {
                        self.navTitle.alpha = 1
                    }
                }
            }
            return
        }
    }
}

extension BrowserView: WKNavigationDelegate {
    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        hideProgressView()
    }
    
    func webView(_ webView: WKWebView, didStartProvisionalNavigation navigation: WKNavigation!) {
        showProgressView()
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        hideProgressView()
    }
}

// MARK: - BrowserView Viper Components API
private extension BrowserView {
    var presenter: BrowserPresenterApi {
        return _presenter as! BrowserPresenterApi
    }
    var displayData: BrowserDisplayData {
        return _displayData as! BrowserDisplayData
    }
}
