//
//  EmotionDataSet+CoreDataProperties.swift
//  
//
//  Created by 安田洋介 on 10/16/15.
//
//
//  Choose "Create NSManagedObject Subclass…" from the Core Data editor menu
//  to delete and recreate this implementation file for your updated model.
//

import Foundation
import CoreData

extension EmotionDataSet {

    @NSManaged var note: String?
    @NSManaged var created_at: NSDate!
    @NSManaged var updated_at: NSDate!
    @NSManaged var emotion_datas: NSSet?

}
