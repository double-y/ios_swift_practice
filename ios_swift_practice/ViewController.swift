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
    
    var managedObjectContext: NSManagedObjectContext! = nil
    
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

        managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext

        do{
            let emotions = try Emotion.fetchAll(managedObjectContext)
            for emotion in emotions! {
                managedObjectContext.deleteObject(emotion)
            }
            try managedObjectContext.save()
            try Emotion.create(managedObjectContext, name: "happiness")
            try Emotion.create(managedObjectContext, name: "stress")
        }catch{
            print("create error")
        }
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
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let vc = segue.destinationViewController as? YYAddEmotionDataNavigationController{
            let emotion = try! Emotion.fetchAll(managedObjectContext)
            if(emotion == nil){
            }else{
                vc.emotionCount = 1
                vc.emotions = emotion!
            }
        }
    }

}

