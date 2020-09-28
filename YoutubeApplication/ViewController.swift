//
//  ViewController.swift
//  YoutubeApplication
//
//  Created by Sanjeev Viswanath on 9/27/20.
//

import UIKit

class ViewController: UIViewController {

    var model = Model()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        model.getVideos()
        
        
        
    }


}

