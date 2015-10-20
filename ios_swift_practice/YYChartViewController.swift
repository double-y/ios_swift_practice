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
        let managedObjectContext = (UIApplication.sharedApplication().delegate as! AppDelegate).managedObjectContext
        lineChart.descriptionText = "text"
        lineChart.noDataTextDescription = "no data"
        let emotionDataSets = try! EmotionDataSet.fetchAll(managedObjectContext)
        /*emotionDataSets.map{ (emotionDataSet: EmotionDataSet) -> ([(String, Int)], String, Date) in
            emotionDataSet
            emotionDataSet.emotion_datas.map{ (emotionData: EmotionData) -> (String, NSNumber) in
                return (emotionData.emotion.name, emotionData.value)
            }
        }*/
        var dataSets = [String: [(ChartDataEntry, String?)]]()
        
        for emotion in try! Emotion.fetchAll(managedObjectContext)!{
            print(emotion.name)
            dataSets[emotion.name] = []
            print(emotion.emotionDatas!.count)
        }

        for emotionDataSet in emotionDataSets! {
            print(emotionDataSet.emotionDatas)
            print(emotionDataSet.emotionDatas?.count)
            for element in emotionDataSet.emotionDatas!{
                let emotionData = (element as! EmotionData)
                let dataNode = (ChartDataEntry(value: emotionData.value! as Double, xIndex: Int(emotionDataSet.createdAt!.timeIntervalSinceNow/pow(10,3)/60/60)), emotionDataSet.note)
                print(emotionData.emotion.name)
                dataSets[emotionData.emotion.name]!.append(dataNode)
            }
        }
        
        lineChart.data = LineChartData(xVals: [Int](-25...1), dataSets: dataSets.map{
                LineChartDataSet(yVals: $1.map
                {(dataEntry:ChartDataEntry, note:String?) -> ChartDataEntry in
                    dataEntry},
                label: $0)
            })
        lineChart.xAxis.spaceBetweenLabels = 1
        lineChart.leftAxis.axisMinimum = 0
        lineChart.leftAxis.axisMaximum = 10
        lineChart.rightAxis.enabled = false
        lineChart.xAxis.labelPosition = ChartXAxis.XAxisLabelPosition.Bottom
    }
    
}
