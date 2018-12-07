//
//  ViewController.swift
//  FitnessAnatomy
//
//  Created by Doğa Bayram on 4.12.2018.
//  Copyright © 2018 Doğa Bayram. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
       swipe()
        
        
    }
    override var preferredStatusBarStyle : UIStatusBarStyle {
        return .lightContent
    }

    @IBAction func nextScreenButton(_ sender: UIButton) {
        performSegue(withIdentifier: "showPartOfBody", sender: self)
    }
    
    
    func swipe() {
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(nextScreenButton(_:)))
        swipe.direction = UISwipeGestureRecognizer.Direction.left
        self.view.addGestureRecognizer(swipe)
        
        
    }
    
}

