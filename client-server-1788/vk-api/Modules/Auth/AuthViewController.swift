//
//  AuthViewController.swift
//  client-server-1788
//
//  Created by Artur Igberdin on 10.12.2021.
//

import UIKit
import WebKit

class AuthViewController: UIViewController, WKNavigationDelegate {

    @IBOutlet weak var webView: WKWebView! {
        didSet {
            webView.navigationDelegate = self
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //TODO: - Текущую сравнить с датой в expiresIn
//        if !Session.shared.token.isEmpty, Session.shared.userId > 0 {
//            performSegue(withIdentifier: "showTabBarSegue", sender: nil)
//        }
        
        authorizeToVK()
    }
    
    func authorizeToVK() {
        
        var urlComponents = URLComponents()
        urlComponents.scheme = "https"
        urlComponents.host = "oauth.vk.com"
        urlComponents.path = "/authorize"
        urlComponents.queryItems = [
            URLQueryItem(name: "client_id", value: "7822904"),
            URLQueryItem(name: "display", value: "mobile"),
            URLQueryItem(name: "redirect_uri", value: "https://oauth.vk.com/blank.html"),
            URLQueryItem(name: "scope", value: "262150"),
            URLQueryItem(name: "response_type", value: "token"),
            URLQueryItem(name: "revoke", value: "1"),
            URLQueryItem(name: "v", value: "5.68")
        ]
        
        let request = URLRequest(url: urlComponents.url!)
        
        webView.load(request)
    }
    
    func webView(_ webView: WKWebView, decidePolicyFor navigationResponse: WKNavigationResponse, decisionHandler: @escaping (WKNavigationResponsePolicy) -> Void) {
        
        guard let url = navigationResponse.response.url, url.path == "/blank.html", let fragment = url.fragment  else {
            
            print(navigationResponse.response.url)
            decisionHandler(.allow)
            return
        }
        
        //https://oauth.vk.com/blank.html#access_token=b291beab60edaf11cc10704cc2937ac1db857a7e4d5aa508df1d1784e01142811e9e1c18ab53425dd534c&expires_in=86400&user_id=223761261
        
        //[access_token, b291beab60edaf11cc10704cc2937ac1db857a7e4d5aa508df1d1784e01142811e9e1c18ab53425dd534c, expires_in, 86400, user_id, 223761261]
        //[:]
        
        let params = fragment
                    .components(separatedBy: "&")
                    .map { $0.components(separatedBy: "=") }
                    .reduce([String: String]()) { result, param in
                                    var dict = result //буфер
                                    let key = param[0]
                                    let value = param[1]
                                    dict[key] = value
                                    return dict
                            }
        
        guard let token = params["access_token"], let userId = params["user_id"] else { return }
        
        Session.shared.token = token
        Session.shared.userId = Int(userId) ?? 0
        
        performSegue(withIdentifier: "showTabBarSegue", sender: nil)
        print(url)
        
        decisionHandler(.cancel)
    }
    
}
