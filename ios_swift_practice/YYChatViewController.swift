//
//  YYChatViewController.swift
//  ios_swift_practice
//
//  Created by 安田洋介 on 10/15/15.
//  Copyright © 2015 安田洋介. All rights reserved.
//

import UIKit
import Charts

class YYChatViewController: UIViewController {

    @IBOutlet var lineChart: LineChartView!

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
        lineChart.descriptionText = "text"
        lineChart.noDataTextDescription = "no data"
        let dataset = LineChartDataSet(yVals: [
            BarChartDataEntry(value: 1, xIndex: 0),
            BarChartDataEntry(value: 2, xIndex: 1),
            BarChartDataEntry(value: 5, xIndex: 2),
            BarChartDataEntry(value: 3, xIndex: 3),
            BarChartDataEntry(value: 3, xIndex: 4),
            BarChartDataEntry(value: 3, xIndex: 5),
            BarChartDataEntry(value: 3, xIndex: 6)
            ])
        let calendar = NSCalendar(calendarIdentifier: NSGregorianCalendar)
        let today = NSDate()
        let oneWeekDates = (0...6).map({
            calendar?.dateByAddingUnit(NSCalendarUnit.Day, value: -$0,toDate: today, options: [])
        })
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "EEE"
        let weekStrings = oneWeekDates.map{
            dateFormatter.stringFromDate($0!)
        }
        print(weekStrings)
        
        let chartData = LineChartData(xVals: weekStrings.reverse(), dataSet: dataset)
        lineChart.data = chartData
        lineChart.xAxis.spaceBetweenLabels = 1
        lineChart.leftAxis.axisMinimum = 0
        lineChart.leftAxis.axisMaximum = 10
        lineChart.rightAxis.enabled = false
        lineChart.xAxis.labelPosition = ChartXAxis.XAxisLabelPosition.Bottom
        lineChart.setVisibleXRange(minXRange: 5.0, maxXRange: 5.0)
    }
    
}
