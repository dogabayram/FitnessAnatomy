//
//  DetailsViewController.swift
//  FitnessAnatomy
//
//  Created by Doğa Bayram on 4.12.2018.
//  Copyright © 2018 Doğa Bayram. All rights reserved.
//

import UIKit
import GoogleMobileAds

class DetailsViewController: UIViewController , GADBannerViewDelegate {

    @IBOutlet weak var textViewInfo: UITextView!
    @IBOutlet weak var imageView: UIImageView!
    
    @IBOutlet weak var bannerView: GADBannerView!
    
    var newImage = UIImage()
    var infoText = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        bannerView.rootViewController = self
        bannerView.load(GADRequest())
        bannerView.delegate = self

        
        imageView.image = newImage
        
        textViewInfo.isEditable = false
        textViewInfo.text = infoText
      
   
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        textViewInfo.setContentOffset(CGPoint.zero, animated: false)
    }
    
}
