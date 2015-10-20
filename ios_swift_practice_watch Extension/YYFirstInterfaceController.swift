//
//  YYFirstViewController.swift
//  ios_swift_practice
//
//  Created by 安田洋介 on 10/19/15.
//  Copyright © 2015 安田洋介. All rights reserved.
//

import WatchKit
import WatchConnectivity

class YYFirstInterfaceController: WKInterfaceController, WCSessionDelegate{
    
    var emotionIndex = 0
    @IBOutlet var nextButton: WKInterfaceButton!
    
    @IBAction func next() {
        if(getExtensionDelegate().emotionNames?.count == emotionIndex+1){
            popToRootController()
        }else{
            pushControllerWithName("YYFirstInterfaceController", context: [
                "emotionName": "\(getExtensionDelegate().emotionNames?[emotionIndex+1])",
                "emotionIndex": "\(emotionIndex+1)"
                ]
            )
        }
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        
        let delegate = getExtensionDelegate()
        let session = getExtensionDelegate().session
        session?.delegate = self
        session?.activateSession()
        if(context == nil){
            session?.sendMessage(["session": "start"], replyHandler: {(response: [String:AnyObject]) -> Void in
                print(response)
                delegate.emotionNames = response["emotionNames"] as! [String]?
                self.nextButton.setHidden(false)
                self.setTitle(self.getExtensionDelegate().emotionNames?[self.emotionIndex])
                }, errorHandler: {(error:NSError) -> Void in
                    print("error")
            })
        }else{
            let contextDict = context as? Dictionary<String, String>
            let title = contextDict?["emotionName"]
            self.setTitle(title)
            emotionIndex = Int((contextDict?["emotionIndex"])!)!
            self.nextButton.setHidden(false)
        }
        
        if(getExtensionDelegate().emotionNames?.count == emotionIndex+1){
            self.nextButton.setTitle("Finish")
        }
    }

    override func willActivate() {
        super.willActivate()
    }
    
    func getExtensionDelegate() -> ExtensionDelegate{
        return WKExtension.sharedExtension().delegate as! ExtensionDelegate
    }
    
    
}
