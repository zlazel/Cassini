//
//  ViewController.swift
//  testCassini
//
//  Created by AhmedZlazel on 7/5/18.
//  Copyright © 2018 AhmedZlazel. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIScrollViewDelegate {

    var imageView = UIImageView()
    var image: UIImage?{
        get {
            return imageView.image
        }
        set{
            imageView.image = newValue
            imageView.sizeToFit()
            scrollView.contentSize = imageView.frame.size

        }
    }
    @IBOutlet weak var scrollView: UIScrollView!{
        didSet{
            scrollView.minimumZoomScale = 0.04
            scrollView.maximumZoomScale = 1.0
            scrollView.delegate = self
            scrollView.addSubview(imageView)
        }
    }
    
    func viewForZooming(in scrollView: UIScrollView) -> UIView? {
        return imageView
    }
    
    var imageURL: URL? {
        didSet{
            image = nil
     
            if view.window != nil{
            fetchImage()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        if image == nil{
            fetchImage()
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if imageURL == nil {
            imageURL = Bundle.main.url(forResource: "Oval", withExtension: "jpg")
        }
    }
    private func fetchImage(){
        if imageURL != nil {
            if let imageData = try? Data(contentsOf: imageURL!){
                image = UIImage(data: imageData)
                
            }
        }
    }

}

