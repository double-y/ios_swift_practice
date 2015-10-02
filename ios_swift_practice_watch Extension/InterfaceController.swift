//
//  InterfaceController.swift
//  ios_swift_practice_watch Extension
//
//  Created by 安田洋介 on 9/14/15.
//  Copyright © 2015 安田洋介. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

    @IBOutlet var CountLabel: WKInterfaceLabel!
    var count = 0

    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        // Configure interface objects here.
        setCountLabelCount(count)
    }

    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }

    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }
    
    @IBAction func addCountLabel() {
        count += 1
        setCountLabelCount(count)
    }
    
    @IBAction func reduceCountLabel() {
        count -= 1
        setCountLabelCount(count)
    }
    
    func setCountLabelCount(count: Int) {
        // print(UIFont.familyNames()) ["Arial Hebrew", "Oriya Sangam MN", "Symbol", "Tamil Sangam MN", "Gurmukhi MN", "Courier New", "Courier", "Kohinoor Bangla", "Apple Color Emoji", "Lao Sangam MN", "Bangla Sangam MN", "Telugu Sangam MN", "Kailasa", "PingFang TC", "Heiti SC", "Malayalam Sangam MN", "Thonburi", "Zapf Dingbats", "Kohinoor Telugu", "Avenir Next", "Apple SD Gothic Neo", "Helvetica", "Euphemia UCAS", "PingFang SC", "PingFang HK", "Gujarati Sangam MN", "Heiti TC", "Sinhala Sangam MN", "Kannada Sangam MN", "Hiragino Sans", "Khmer Sangam MN", "Times New Roman", "Geeza Pro", "Helvetica Neue", "Kohinoor Devanagari", "Avenir"]
        let menloFont = UIFont(name: "Arial Hebrew", size: 12.0)!
        let fontAttrs = [NSFontAttributeName : menloFont]
        
        // Set the text on the label object
        self.CountLabel.setAttributedText(NSAttributedString(string: String(count), attributes: fontAttrs))
    }

}
