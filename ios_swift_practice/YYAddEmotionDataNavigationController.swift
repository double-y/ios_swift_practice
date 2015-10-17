//
//  YYAddEmotionDataNavigationController.swift
//  ios_swift_practice
//
//  Created by 安田洋介 on 10/16/15.
//  Copyright © 2015 安田洋介. All rights reserved.
//

import Foundation

import UIKit

class YYAddEmotionDataNavigationController: UINavigationController{
    var emotionCount = 1
    var emotions: [Emotion]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func cancel(sender: AnyObject) {
        print("cancel")
    }
    
    @IBAction func done(sender: AnyObject) {
        performSegueWithIdentifier("NextEmotionDataSegue", sender: self)
    }
    
    @IBAction func AddData(sender: AnyObject) {
    }
}