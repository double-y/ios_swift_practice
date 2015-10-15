//
//  ViewController.swift
//  ios_swift_practice
//
//  Created by 安田洋介 on 7/8/15.
//  Copyright © 2015 安田洋介. All rights reserved.
//

import UIKit
import WatchConnectivity
import Charts
import CoreData

class ViewController: UIViewController, WCSessionDelegate{
    var session: WCSession!
    @IBOutlet weak var angerValue: UITextField!
    @IBOutlet weak var happinessValue: UITextField!
    
    var happinessData = [NSManagedObject]()
    var angerData = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(WCSession.isSupported())
        if (WCSession.isSupported()) {
            session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
        }

        /*
        //1
        let appDelegate =
        UIApplication.sharedApplication().delegate as! AppDelegate
        let managedContext = appDelegate.managedObjectContext
        //2
        let predicate = NSPredicate(format: "name==happiness")
        let happinessFetchRequest = NSFetchRequest(entityName: "Emotion")
        happinessFetchRequest.predicate = predicate
        //3
        do {
            let happinessEmotionResults =
            try managedContext.executeFetchRequest(happinessFetchRequest)
            let happinessEmotion = happinessEmotionResults as! [Emotion]
            happinessEmotion
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        */
    }
    
    func session(session: WCSession, didReceiveMessage message: [String : AnyObject], replyHandler: ([String : AnyObject]) -> Void) {
        dispatch_async(dispatch_get_main_queue()) {
            self.angerValue.text = message["anger_value"] as? String
            self.happinessValue.text = message["happiness_value"] as? String
        }
        replyHandler(["aa":"aa"])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

