//
//  YYChatViewController.swift
//  ios_swift_practice
//
//  Created by 安田洋介 on 10/15/15.
//  Copyright © 2015 安田洋介. All rights reserved.
//

import UIKit
import Charts

class YYChartViewController: UIViewController {

    @IBOutlet var lineChart: LineChartView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        let barButtonItem = UIBarButtonItem()
        barButtonItem.title = "Back"
        barButtonItem.target = self
        barButtonItem.action = Selector("backHome:")
        navigationItem.leftBarButtonItem=barButtonItem
        
        let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        lineChart.descriptionText = "1week data"
        lineChart.noDataTextDescription = "no data"
    
        let allEmotions = try! Emotion.fetchAll(managedObjectContext)
        
        let lineChartDataSets = allEmotions?.map{(emotion: Emotion) -> LineChartDataSet in
            let dataEntries = (emotion.emotionDatas?.allObjects as!
                [EmotionData]).map{(emotionData: EmotionData) -> ChartDataEntry in
                    let hourInterval = Int((emotionData.createdAt!.timeIntervalSinceNow)/60/60)
                    let hourIntervalForWeek = 24*7+hourInterval
                    return ChartDataEntry(value: emotionData.value as Double, xIndex: hourIntervalForWeek, data: emotionData.emotionDataSet.note)
            }
            
            let lineChartDataSet = LineChartDataSet(yVals: dataEntries, label: emotion.name)
            switch emotion.getColor(){
            case Emotion.EmotionColor.Red:
                lineChartDataSet.setCircleColor(UIColor.redColor())
                lineChartDataSet.setColor(UIColor.redColor())
            case Emotion.EmotionColor.Yellow:
                lineChartDataSet.setCircleColor(UIColor.yellowColor())
                lineChartDataSet.setColor(UIColor.yellowColor())
            case Emotion.EmotionColor.Green:
                lineChartDataSet.setCircleColor(UIColor.greenColor())
                lineChartDataSet.setColor(UIColor.greenColor())
            case Emotion.EmotionColor.Blue:
                lineChartDataSet.setCircleColor(UIColor.blueColor())
                lineChartDataSet.setColor(UIColor.blueColor())
            }
            return lineChartDataSet
        }
        
        lineChart.data = LineChartData(xVals: [Int](0...(24*7)), dataSets:lineChartDataSets)
        lineChart.xAxis.gridLineWidth = 0
        lineChart.xAxis.spaceBetweenLabels = 1
        lineChart.leftAxis.axisMinimum = 0
        lineChart.leftAxis.axisMaximum = 10
        lineChart.rightAxis.enabled = false
        lineChart.xAxis.labelPosition = ChartXAxis.XAxisLabelPosition.Bottom
    }
    
    func backHome(sender: AnyObject) {
        dismissViewControllerAnimated(true, completion: nil)
    }
    
}
