//
//  Emotion+CoreDataProperties.swift
//  
//
//  Created by 安田洋介 on 10/11/15.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension Emotion {

    @NSManaged var createdAt: NSDate!
    @NSManaged var name: String!
    @NSManaged var emotionDatas: NSMutableSet?

    @NSManaged func addEmotionDatasObject(emotionData: EmotionData)

}
