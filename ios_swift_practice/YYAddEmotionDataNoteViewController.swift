//
//  YYAddEmotionDataNoteViewController.swift
//  ios_swift_practice
//
//  Created by 安田洋介 on 10/16/15.
//  Copyright © 2015 安田洋介. All rights reserved.
//

import UIKit

class YYAddEmotionDataNoteViewController: UIViewController{
    @IBOutlet weak var noteField: UITextView!
    override func viewDidLoad() {
        self.title = "Note"
    }
    @IBAction func finish(sender: AnyObject) {
        AppDelegate.resetNextSchedule(UIApplication.sharedApplication())
        getParentViewController().saveNote(noteField.text!)
        dismissViewControllerAnimated(true, completion: nil)
    }
    @IBAction func back(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    func getParentViewController() -> YYAddEmotionDataNavigationController{
        return parentViewController as! YYAddEmotionDataNavigationController
    }
}