//
//  EmotionData+CoreDataProperties.swift
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

extension EmotionData {

    @NSManaged var value: NSNumber!
    @NSManaged var createdAt: NSDate!
    @NSManaged var emotion: Emotion!
    @NSManaged var emotionDataSet: EmotionDataSet!

}
