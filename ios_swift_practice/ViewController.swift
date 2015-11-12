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

class ViewController: UIViewController{
    var managedObjectContext: NSManagedObjectContext! = nil
    
    @IBOutlet weak var dataSetCount: UILabel!
    var happinessData = [NSManagedObject]()
    var angerData = [NSManagedObject]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
        /*print(WCSession.isSupported())
        session = WCSession.defaultSession()
        session?.delegate = self
        session?.activateSession()*/


        managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
    }
    
    override func viewWillAppear(animated: Bool) {
        let emotionDataSets = (try! EmotionDataSet.fetchAll(managedObjectContext))
        if emotionDataSets?.count > 0 {
            dataSetCount.text = "\(emotionDataSets!.count)"
        }
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
                vc.emotionIndex = 0
                vc.emotions = emotion!
                vc.emotionDataSet = try! EmotionDataSet.create(managedObjectContext)
            }
        }
    }

}

