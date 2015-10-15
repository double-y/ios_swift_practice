//
//  EmotionData.swift
//  
//
//  Created by 安田洋介 on 10/11/15.
//
//

import Foundation
import CoreData

class EmotionData: NSManagedObject {
    static let entityName = "EmotionData"

// Insert code here to add functionality to your managed object subclass
    static func createEmotionData(context:NSManagedObjectContext, emotion:Emotion, value:Int) throws -> EmotionData{
        let emotionData = NSEntityDescription.insertNewObjectForEntityForName(entityName, inManagedObjectContext: context) as! EmotionData
        emotionData.value = value
        emotion.emotion_datas?.setByAddingObject(emotionData)
        try context.save()
        return emotionData
    }

}
