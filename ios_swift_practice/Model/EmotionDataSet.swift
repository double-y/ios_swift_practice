//
//  EmotionDataSet.swift
//  
//
//  Created by 安田洋介 on 10/16/15.
//
//

import Foundation
import CoreData

class EmotionDataSet: NSManagedObject {
    static let entityName = "EmotionDataSet"

// Insert code here to add functionality to your managed object subclass
    static func create(managedObjectContext:NSManagedObjectContext) throws -> EmotionDataSet{
        let emotionDataSet = NSEntityDescription.insertNewObjectForEntityForName(entityName, inManagedObjectContext: managedObjectContext) as! EmotionDataSet
        emotionDataSet.created_at = NSDate()
        return emotionDataSet
    }
    
    static func fetchAll(managedObjectContext:NSManagedObjectContext) throws -> [EmotionDataSet]?{
        let fetchRequest = NSFetchRequest(entityName: entityName)
        return try managedObjectContext.executeFetchRequest(fetchRequest) as? [EmotionDataSet]
    }
}
