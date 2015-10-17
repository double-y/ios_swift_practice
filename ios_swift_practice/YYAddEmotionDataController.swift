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

    var emotionIndex = 0
    var emotionName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        emotionLabel.text = emotionName
        self.title = getParentViewController().emotions[emotionIndex].name
        let nextEmotionIndex = emotionIndex + 1
        if(nextEmotionIndex < getParentViewController().emotions.count){
            finishButton.title = getParentViewController().emotions[nextEmotionIndex].name
        }
    }
    
    @IBAction func finish(sender: AnyObject) {
        let emotionData = try! EmotionData.create(getParentViewController().managedObjectContext, value: Int(emotionSlider.value))
        getParentViewController().saveEmotionData(emotionIndex, emotionData:emotionData)
        
        let viewController = YYAddEmotionDataController.instantiateViewController()
        viewController.emotionIndex = emotionIndex + 1
        if(viewController.emotionIndex < getParentViewController().emotions.count){
            self.navigationController!.pushViewController(viewController, animated: true)
            viewController.title = getParentViewController().emotions[viewController.emotionIndex].name
            getParentViewController().navigationController?.pushViewController(viewController, animated: true)
        }else{
            let noteViewController = UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("YYAddEmotionDataNoteViewController") as! YYAddEmotionDataNoteViewController
            navigationController?.pushViewController(noteViewController, animated: true)
        }
    }
    
    func getParentViewController() -> YYAddEmotionDataNavigationController{
        return parentViewController as! YYAddEmotionDataNavigationController
    }
    
    static func instantiateViewController() -> YYAddEmotionDataController{
        return UIStoryboard(name: "Main", bundle: nil).instantiateViewControllerWithIdentifier("YYAddEmotionDataController") as! YYAddEmotionDataController
    }
}