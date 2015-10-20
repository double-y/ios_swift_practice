//
//  EmotionDataSet+CoreDataProperties.swift
//  
//
//  Created by 安田洋介 on 10/17/15.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension EmotionDataSet {

    @NSManaged var createdAt: NSDate?
    @NSManaged var note: String?
    @NSManaged var updatedAt: NSDate?
    @NSManaged var emotionDatas: NSMutableSet?

    @NSManaged func addEmotionDatasObject(emotionData: EmotionData)

}
