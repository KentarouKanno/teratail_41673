//
//  CustomCell.swift
//  teratail_41673
//
//  Created by KentarOu on 2016/07/21.
//  Copyright © 2016年 KentarOu. All rights reserved.
//

import UIKit

class CustomCell: UITableViewCell {
    

    @IBOutlet weak var timerLabel : UILabel!
    @IBOutlet weak var targetTimeLabel: UILabel!
    @IBOutlet weak var remainLabel: UILabel!
    
    let format = "yyyy/MM/dd HH:mm:ss"
    
    var data: DataModel! {
        didSet {
            
            targetTimeLabel.text = convertToDate(data.targetData) + "まで"
            updateLabel()
        }
    }
    
    func updateLabel() {
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = format
        
        let nowDate = NSDate()
        let dateString = DateUtils.stringFromDate(nowDate, format: format)
        
        let startDate:NSDate? = dateFormatter.dateFromString(dateString)
        let endDate:NSDate? = dateFormatter.dateFromString(data.targetData)
        
        let cal = NSCalendar.currentCalendar()
        
        let unitFlags: NSCalendarUnit = [.Year, .Month, .Day, .Hour, .Minute, .Second]
        let components = cal.components(unitFlags, fromDate: startDate!, toDate: endDate!, options: NSCalendarOptions())
        
        var result: String = components.year > 0 ? String(components.year) + "年" : ""
        result += components.day > 0 ? String(components.day) + "日" : ""
        result += components.hour > 0 ? String(components.hour) + "時間" : ""
        result += components.minute > 0 || !result.isEmpty ? String(components.minute) + "分" : ""
        result += components.second > 0 || !result.isEmpty ? String(components.second) + "秒" : ""
        
        
        if result.isEmpty {
            remainLabel.hidden = true
            timerLabel.text = "期限切れ"
            return
        } else {
            remainLabel.hidden = false
        }
        timerLabel.text = result
    }

    
    func convertToDate(dateString: String) -> String {
        
        // NSDateに変換
        let date = DateUtils.dateFromString(dateString, format: format)
        
        // Stringに再変換
        let dateString = DateUtils.stringFromDate(date, format: "yyyy年MM月dd日 HH時mm分ss秒")
        return dateString
    }
}

class DateUtils {
    class func dateFromString(string: String, format: String) -> NSDate {
        let formatter: NSDateFormatter = NSDateFormatter()
        formatter.dateFormat = format
        return formatter.dateFromString(string)!
    }
    
    class func stringFromDate(date: NSDate, format: String) -> String {
        let formatter: NSDateFormatter = NSDateFormatter()
        formatter.dateFormat = format
        return formatter.stringFromDate(date)
    }
}
