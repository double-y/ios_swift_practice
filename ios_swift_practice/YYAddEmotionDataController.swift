//
//  AddEmotionDataController.swift
//  ios_swift_practice
//
//  Created by 安田洋介 on 10/15/15.
//  Copyright © 2015 安田洋介. All rights reserved.
//

import UIKit

class YYAddEmotionDataController: UIViewController{    
    @IBOutlet weak var emotionLabel: UILabel!
    @IBOutlet weak var emotionSlider: UISlider!
    
    @IBOutlet weak var backBarButton: UIBarButtonItem!

    @IBOutlet weak var finishButton: UIBarButtonItem!

    var emotionCount = 1
    var emotionName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emotionLabel.text = emotionName
        self.title = getParentViewController().emotions[emotionCount-1].name
        let nextEmotionIndex = emotionCount
        if(nextEmotionIndex < getParentViewController().emotions.count){
            finishButton.title = getParentViewController().emotions[nextEmotionIndex].name
        }
    }
    
    @IBAction func finish(sender: AnyObject) {
        let viewController = YYAddEmotionDataController.instantiateViewController()
        viewController.emotionCount = emotionCount + 1
        if(viewController.emotionCount <= getParentViewController().emotions.count){
            self.navigationController!.pushViewController(viewController, animated: true)
            viewController.title = getParentViewController().emotions[emotionCount-1].name
            getParentViewController().navigationController?.pushViewController(viewController, animated: true)
        }else{
            dismissViewControllerAnimated(true, completion: nil)
        }
    }
    
    func getParentViewController() -> YYAddEmotionDataNavigationController{
        return parentViewController as! YYAddEmotionDataNavigationController
    }
    
    static func instantiateViewController() -> YYAddEmotionDataController{
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("YYAddEmotionDataController") as! YYAddEmotionDataController
    }
}