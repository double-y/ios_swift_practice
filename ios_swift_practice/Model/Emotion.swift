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
    
    static func create(context: NSManagedObjectContext, name:String) throws -> Emotion? {
        let fetchRequest = NSFetchRequest(entityName: entityName)
        fetchRequest.predicate = NSPredicate(format: "%K like %@", argumentArray:["name", name])
        let result = try context.executeFetchRequest(fetchRequest)
        if(result.count>0){
            throw ModelError.UniqueViolationError
        }
        
        let emotion = NSEntityDescription.insertNewObjectForEntityForName(entityName, inManagedObjectContext: context) as! Emotion
        emotion.name = name
        try context.save()
        return emotion
    }
    
    static func fetchAll(context: NSManagedObjectContext) throws -> [Emotion]? {
        let fetchRequest = NSFetchRequest(entityName: entityName)
        return try context.executeFetchRequest(fetchRequest) as? [Emotion]
    }
    
    static func fetchByName(context: NSManagedObjectContext, name: String) throws -> [Emotion]? {
    
        let fetchRequest = NSFetchRequest(entityName: entityName)
        fetchRequest.predicate = NSPredicate(format: "%K like %@", argumentArray:["name", name])
    
        return try context.executeFetchRequest(fetchRequest) as? [Emotion]
    }
}
