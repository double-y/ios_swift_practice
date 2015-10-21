//
//  ExtensionDelegate.swift
//  ios_swift_practice_watch Extension
//
//  Created by 安田洋介 on 9/14/15.
//  Copyright © 2015 安田洋介. All rights reserved.
//

import WatchKit
import WatchConnectivity

class ExtensionDelegate: NSObject, WKExtensionDelegate, WCSessionDelegate{
    var session: WCSession?
    var emotionNames: [String]?
    var emotionColors: [String]?
    static let flagForMessage = "flag"

    func applicationDidFinishLaunching() {
        // Perform any final initialization of your application.
        session = WCSession.defaultSession()
        session!.delegate = self
        session!.activateSession()
    }

    func applicationDidBecomeActive() {
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }

    func applicationWillResignActive() {
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, etc.
    }
    
    /*func sessionStart(replyHandler replyHandler:(([String : AnyObject]) -> Void)!, errorHandler:((NSError) -> Void)!){
        self.session!.sendMessage(["session": "start"],replyHandler: {(dict) -> Void in
            print(dict)
            self.emotionNames = dict["emotionNames"] as! [String]?
                replyHandler(dict)
            },errorHandler: {(error) -> Void in
                errorHandler(error)
        })
    }*/
}
