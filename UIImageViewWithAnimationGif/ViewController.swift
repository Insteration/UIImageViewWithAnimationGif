//
//  ViewController.swift
//  UIImageViewWithAnimationGif
//
//  Created by Artem Karmaz on 4/18/19.
//  Copyright © 2019 Artem Karmaz. All rights reserved.
//

import UIKit
import WebKit

class ViewController: UIViewController {

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var myWebView: WKWebView!
    
    let urlCamel = Bundle.main.url(forResource: "camel", withExtension: "gif") // Bundle.main это желтая папка
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        myWebView.layer.borderWidth = 2
        myWebView.layer.borderColor = UIColor.blue.cgColor
        myWebView.layer.cornerRadius = 10
        myWebView.contentMode = .scaleAspectFit
        print(urlCamel?.path ?? "Url Camel is Error")
        myWebView.load(URLRequest(url: urlCamel!))
    }


}

