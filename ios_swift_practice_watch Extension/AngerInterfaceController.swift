//
//  InterfaceController.swift
//  ios_swift_practice_watch Extension
//
//  Created by 安田洋介 on 9/14/15.
//  Copyright © 2015 安田洋介. All rights reserved.
//

import WatchKit
import Foundation
import WatchConnectivity

class AngerInterfaceController: WKInterfaceController, WCSessionDelegate {
    @IBOutlet var sequencePicker: WKInterfacePicker!
    var value = 0
    let items:[WKPickerItem] = (0...10).map {
        let pickerItem = WKPickerItem()
        let fileName = "single\($0)anger.png"
        pickerItem.contentImage = WKImage(imageName: fileName)
        return pickerItem
    }
    var session: WCSession!

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        sequencePicker.setItems(items)
        sequencePicker.setSelectedItemIndex(5)
        sequencePicker.focus()
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
        print(WCSession.isSupported())
        if WCSession.isSupported() {
            session = WCSession.defaultSession()
            session.delegate = self
            session.activateSession()
        }else{
            
        }
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func pickerItemChanged(value: Int) {
        self.value = value
    }
    
    @IBAction func sendData() {
        session.sendMessage(["anger_value": String(self.value)],
            replyHandler: {(response) -> Void in
                print("response")
                self.pushControllerWithName("happinessController", context:nil)
            },
            errorHandler: {(error) -> Void in
                print("error")
            }
        )
    }
    
    /*
    func setCountLabelCount(count: Int) {
        // print(UIFont.familyNames()) ["Arial Hebrew", "Oriya Sangam MN", "Symbol", "Tamil Sangam MN", "Gurmukhi MN", "Courier New", "Courier", "Kohinoor Bangla", "Apple Color Emoji", "Lao Sangam MN", "Bangla Sangam MN", "Telugu Sangam MN", "Kailasa", "PingFang TC", "Heiti SC", "Malayalam Sangam MN", "Thonburi", "Zapf Dingbats", "Kohinoor Telugu", "Avenir Next", "Apple SD Gothic Neo", "Helvetica", "Euphemia UCAS", "PingFang SC", "PingFang HK", "Gujarati Sangam MN", "Heiti TC", "Sinhala Sangam MN", "Kannada Sangam MN", "Hiragino Sans", "Khmer Sangam MN", "Times New Roman", "Geeza Pro", "Helvetica Neue", "Kohinoor Devanagari", "Avenir"]
        //let menloFont = UIFont(name: "Arial Hebrew", size: 12.0)!
        //let fontAttrs = [NSFontAttributeName : menloFont]
        
        // Set the text on the label object
        //self.CountLabel.setAttributedText(NSAttributedString(string: String(count), attributes: fontAttrs))
    }*/

}
