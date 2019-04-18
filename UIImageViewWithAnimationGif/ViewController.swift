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

extension UIImageView {
    static func takeImageFromGif(_ imageName: String) -> UIImageView? {
        guard let path = Bundle.main.path(forResource: imageName, ofType: "gif") else { return nil }
        let url = URL(fileURLWithPath: path)
        guard let gifData = try? Data(contentsOf: url), let source = CGImageSourceCreateWithData(gifData as CFData, nil) else { return nil }
        var images = [UIImage]()
        
        print("------------------- \(imageName) ------------------- String have count gifs \(CGImageSourceGetCount(source)) --------------------")
        for i in 0..<CGImageSourceGetCount(source) {
            if let image = CGImageSourceCreateImageAtIndex(source, i, nil) {
                images.append(UIImage(cgImage: image))
            }
        }
        
        let gifImages = UIImageView()
        gifImages.animationImages = images
        
        return gifImages
    }
}
