//
//  YYInitialInterfaceController.swift
//  ios_swift_practice
//
//  Created by 安田洋介 on 11/12/15.
//  Copyright © 2015 安田洋介. All rights reserved.
//

import Foundation
import UIKit
import WatchKit

class YYInitialInterfaceController: WKInterfaceController{
    override func willActivate() {
        super.willActivate()
    }
    
    override func handleActionWithIdentifier(identifier: String?, forLocalNotification localNotification: UILocalNotification) {
        print(localNotification)
        print("identifier")
        print(identifier)
        if(identifier == "save_data"){
            pushControllerWithName("YYFirstInterfaceController", context: nil)
        }
    }
}