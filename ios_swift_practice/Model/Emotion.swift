//
//  Emotion.swift
//  
//
//  Created by 安田洋介 on 10/11/15.
//
//
import CoreData

class Emotion: NSManagedObject {
    static let entityName = "Emotion"
    
    static let blueColorHexString = "#0f45f7"
    static let greenColorHexString = "#1bff0a"
    static let redColorHexString = "#d41e11"
    static let yellowColorHexString = "#ffff00"

    // Insert code here to add functionality to your managed object subclass
    enum EmotionColor{
        case Blue, Green, Red, Yellow
        func getHexString() -> String{
            switch self{
            case .Blue:
                return Emotion.blueColorHexString
            case .Green:
                return Emotion.greenColorHexString
            case .Red:
                return Emotion.redColorHexString
            case .Yellow:
                return Emotion.yellowColorHexString
            }
        }
    }
    
    static func create(context: NSManagedObjectContext, name:String, color: EmotionColor) throws -> Emotion? {
        let fetchRequest = NSFetchRequest(entityName: entityName)
        fetchRequest.predicate = NSPredicate(format: "%K like %@", argumentArray:["name", name])
        let result = try context.executeFetchRequest(fetchRequest)
        if(result.count>0){
            throw ModelError.UniqueViolationError
        }
        
        let emotion = NSEntityDescription.insertNewObjectForEntityForName(entityName, inManagedObjectContext: context) as! Emotion
        emotion.name = name
        emotion.color = color.getHexString()
        return emotion
    }
    
    static func fetchAll(context: NSManagedObjectContext) throws -> [Emotion]? {
        let fetchRequest = NSFetchRequest(entityName: entityName)
        return try context.executeFetchRequest(fetchRequest) as? [Emotion]
    }
    
    static func fetchByName(context: NSManagedObjectContext, name: String) throws -> Emotion? {
    
        let fetchRequest = NSFetchRequest(entityName: entityName)
        fetchRequest.predicate = NSPredicate(format: "%K like %@", argumentArray:["name", name])
    
        return try context.executeFetchRequest(fetchRequest).first as? Emotion
    }
    
    func getColor() -> EmotionColor {
        switch self.color{
        case Emotion.blueColorHexString:
            return .Blue
        case Emotion.greenColorHexString:
            return .Green
        case Emotion.redColorHexString:
            return .Red
        case Emotion.yellowColorHexString:
            return .Yellow
        default:
            return .Blue
        }
    }
}

