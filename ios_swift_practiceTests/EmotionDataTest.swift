//
//  EmotionDataTest.swift
//  ios_swift_practice
//
//  Created by 安田洋介 on 10/14/15.
//  Copyright © 2015 安田洋介. All rights reserved.
//

import XCTest
import CoreData
@testable import ios_swift_practice

class EmotionDataTest: XCTestCase {
    
    var objectContext: NSManagedObjectContext! = nil
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        //objectContext = setUpInMemoryManagedObjectContext()
        objectContext = setUpInMemoryManagedObjectContext()
    }
    
    func testCreateEmotionData(){
        let emotionName = "createEmotionDataTest"
        let emotion = EmotionTest.createEmotion(emotionName, objectContext: objectContext)
        let emotionData = try! EmotionData.createEmotionData(objectContext, emotion: emotion, value: 5)
        XCTAssertEqual(emotionData.value, 5)
    }

}
