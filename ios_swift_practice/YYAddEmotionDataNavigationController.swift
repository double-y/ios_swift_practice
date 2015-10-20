//
//  YYAddEmotionDataNavigationController.swift
//  ios_swift_practice
//
//  Created by 安田洋介 on 10/16/15.
//  Copyright © 2015 安田洋介. All rights reserved.
//

import Foundation
import CoreData

import UIKit

class YYAddEmotionDataNavigationController: UINavigationController{
    var emotionIndex = 0
    var managedObjectContext: NSManagedObjectContext!
    var emotions: [Emotion]!
    var emotionDataSet: EmotionDataSet!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    }
    
    func saveEmotionData(emotionIndex:Int, emotionData: EmotionData){
        emotions[emotionIndex].addEmotionDatasObject(emotionData)
        emotionDataSet.mutableSetValueForKey("emotionDatas").addObject(emotionData)
        try! managedObjectContext.save()
    }
    
    func saveNote(note:String){
        emotionDataSet.note = note
        try! managedObjectContext.save()
    }
}