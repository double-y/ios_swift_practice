//
//  Emotion.swift
//  
//
//  Created by 安田洋介 on 10/11/15.
//
//

import Foundation
import CoreData

class Emotion: NSManagedObject {
    static let entityName = "Emotion"

    // Insert code here to add functionality to your managed object subclass
    
    static func createData(context: NSManagedObjectContext, name:String) throws -> Emotion? {
        let emotion = NSEntityDescription.insertNewObjectForEntityForName(entityName, inManagedObjectContext: context) as! Emotion
        
        emotion.name = name
        try context.save()
        return emotion
    }
    
    static func fetchData(context: NSManagedObjectContext, name: String) throws -> [Emotion]? {
    
        let fetchRequest = NSFetchRequest(entityName: "Emotion")
        fetchRequest.predicate = NSPredicate(format: "%K like %@", argumentArray:["name", name])
    
        return try context.executeFetchRequest(fetchRequest) as? [Emotion]
    }
}
