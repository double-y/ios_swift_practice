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
        objectContext = setUpInMemoryManagedObjectContext()
    }
    
    func testCreateEmotion(){
        EmotionTest.createEmotion("insert_test", objectContext: objectContext)
    }
    
    func testFetchData(){
        let name = "fetchTest"
        EmotionTest.createEmotion(name, objectContext: objectContext)
        let fetchedData = try! Emotion.fetchData(objectContext, name: name)
        XCTAssertEqual(fetchedData!.count, 1)
    }
    
    static func createEmotion(nameValue:String, objectContext: NSManagedObjectContext) -> Emotion{
        let emotion = try! Emotion.createData(objectContext, name: nameValue)
        try! objectContext.save()
        return emotion!
    }
}
