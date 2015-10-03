//
//  ViewController.swift
//  ios_swift_practice
//
//  Created by 安田洋介 on 7/8/15.
//  Copyright © 2015 安田洋介. All rights reserved.
//

import UIKit
import WatchConnectivity

class ViewController: UIViewController, WCSessionDelegate{

    @IBOutlet weak var countText: UITextField!
    var session: WCSession!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        print(WCSession.isSupported())
        if (WCSession.isSupported()) {
            session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
        }
    }
    
    func session(session: WCSession, didReceiveMessage message: [String : AnyObject]) {
        dispatch_async(dispatch_get_main_queue()) {
            self.countText.text = message["count"] as? String
        }
    }
    
    func handleWatchKitNotification(notification: NSNotification){
        if let userInfo = notification.object as? [String: String] {
            countText.text = userInfo["data"]
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

