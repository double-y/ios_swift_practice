//
//  EmotionTest.swift
//  ios_swift_practice
//
//  Created by 安田洋介 on 10/14/15.
//  Copyright © 2015 安田洋介. All rights reserved.
//

import XCTest
import CoreData
@testable import ios_swift_practice

class EmotionTest: XCTestCase {
    
    var objectContext: NSManagedObjectContext! = nil
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        //objectContext = setUpInMemoryManagedObjectContext()
        objectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    }
    func testAddEmotion(){
        EmotionTest.createEmotion("insert_test", objectContext: objectContext)
    }
    static func createEmotion(nameValue:String, objectContext: NSManagedObjectContext) -> Emotion{
        let emotion = try! Emotion.createData(objectContext, name: nameValue)
        try! objectContext.save()
        return emotion!
    }
}
