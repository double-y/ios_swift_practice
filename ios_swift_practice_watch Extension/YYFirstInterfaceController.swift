//
//  YYFirstViewController.swift
//  ios_swift_practice
//
//  Created by 安田洋介 on 10/19/15.
//  Copyright © 2015 安田洋介. All rights reserved.
//

import WatchKit
import WatchConnectivity

class YYFirstInterfaceController: WKInterfaceController{
    
    var emotionIndex = 0
    var values: [Int] = []
    var value = 5

    @IBOutlet var nextButton: WKInterfaceButton!
    
    @IBOutlet var valuePicker: WKInterfacePicker!
    
    
    @IBAction func changeValue(value: Int) {
        self.value = value
    }
    
    // image generator: http://hmaidasani.github.io/RadialChartImageGenerator/
    
    @IBAction func next() {
        values.append(value)
        if(getExtensionDelegate().emotionNames?.count == emotionIndex+1){
            var contextDict = Dictionary<String, Int>()
            for (index, name) in getExtensionDelegate().emotionNames!.enumerate(){
                contextDict[name] = values[index]
            }
            pushControllerWithName("YYSaveInterfaceController", context:
                contextDict
            )
        }else{
            let nextIndex = self.emotionIndex+1
            let emotionNames = getExtensionDelegate().emotionNames
            var contentDict = Dictionary<String, AnyObject>()
            contentDict["emotionName"] = emotionNames?[nextIndex]
            contentDict["emotionIndex"] = nextIndex
            contentDict["values"] = values
            pushControllerWithName("YYFirstInterfaceController", context:contentDict)
        }
    }
    
    override func awakeWithContext(context: AnyObject?) {
        super.awakeWithContext(context)
        
        
        let delegate = getExtensionDelegate()
        let session = getExtensionDelegate().session
        session?.activateSession()
        
        if(context == nil){
            session?.sendMessage([ExtensionDelegate.flagForMessage: "start"], replyHandler: {(response: [String:AnyObject]) -> Void in
                print(response)
                delegate.emotionNames = response["emotionNames"] as! [String]?
                delegate.emotionColors = response["emotionColors"] as! [String]?
                self.nextButton.setHidden(false)
                self.setTitle(self.getExtensionDelegate().emotionNames?[self.emotionIndex])
                
                let color = delegate.emotionColors![self.emotionIndex]
                let items = self.getPickerItems(color)
                self.valuePicker.setItems(items)
                self.valuePicker.setSelectedItemIndex(self.value)
                self.valuePicker.focus()

                }, errorHandler: {(error:NSError) -> Void in
                    print("error")
            })
        }else{
            let contextDict = context as? Dictionary<String, AnyObject>
            let title = contextDict?["emotionName"] as! String
            self.setTitle(title)
            emotionIndex = (contextDict?["emotionIndex"])! as! Int

            let color = (delegate.emotionColors?[emotionIndex])!
            let items = self.getPickerItems(color)
            self.valuePicker.setItems(items)
            self.valuePicker.setSelectedItemIndex(self.value)
            self.valuePicker.focus()
            
            values = contextDict?["values"] as! [Int]
            
            
            self.nextButton.setHidden(false)
        }
        
        if(getExtensionDelegate().emotionNames?.count == emotionIndex+1){
            self.nextButton.setTitle("Finish")
        }
    }

    override func willActivate() {
        super.willActivate()
    }
    
    func getPickerItems(colorString:String?) -> [WKPickerItem]{
        let items: [WKPickerItem] = (0...10).map {(index) -> WKPickerItem in
            let pickerItem = WKPickerItem()
            let fileName = colorString.flatMap{"single\(index)\($0).png"} ?? "single#ffff00.png"
            print(fileName)
            pickerItem.contentImage = WKImage(imageName: fileName)
            return pickerItem
        }
        return items
    }
    
    func getExtensionDelegate() -> ExtensionDelegate{
        return WKExtension.sharedExtension().delegate as! ExtensionDelegate
    }
    
    
}
