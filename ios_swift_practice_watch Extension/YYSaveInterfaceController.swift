//
//  YYSaveInterfaceController.swift
//  ios_swift_practice
//
//  Created by 安田洋介 on 10/20/15.
//  Copyright © 2015 安田洋介. All rights reserved.
//

import WatchKit
import WatchConnectivity

class YYSaveInterfaceController: WKInterfaceController{
    var emotionDatas: [String: Int]!
    
    override func willActivate() {
        print(emotionDatas)
        getExtensionDelegate().session?.sendMessage(
            [
                ExtensionDelegate.flagForMessage:"saveEmotionDatas",
                "emotionDatas":emotionDatas
            ], replyHandler: {(reply) -> Void in
                print("save")
            }, errorHandler: { (error) -> Void in
                print("error")
        })
    }

    override func awakeWithContext(context: AnyObject?) {
        emotionDatas = context as! Dictionary<String, Int>
    }
    func getExtensionDelegate() -> ExtensionDelegate{
        return WKExtension.sharedExtension().delegate as! ExtensionDelegate
    }
}