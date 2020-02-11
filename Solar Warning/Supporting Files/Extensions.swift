//
//  Extensions.swift
//  Solar Warning
//
//  Created by rafaeldelegate on 11/15/19.
//  Copyright © 2019 rafaeldelegate. All rights reserved.
//

import Foundation
import UIKit

//# Day: d, dd 31
//# Month: MM 09 MMM Sep MMMM September
//# Year: yyyy 2019
//# Hour: HH 12
//# Minutes: mm 45
//# Seconds: ss 47 ss.SS 47.11 ss.SSS 47.112
public enum DateFormat: String, CodingKey {
    // returns 2018-09-12T14:11:54+0000
    case yearMothDayTHourMinutesSeconds = "yyyy-MM-dd'T'HH:mm:ssZ"
    // returns 31/12/1876
    case dayMonthAndYear = "dd/MM/yyyy"
    // returns 12/31/1876
    case monthDayAndYear = "MM/dd/yyy"
    // returns wednesday 12/31/1879
    case extendedDayOfTheWeekMonthDayAndYear = "EEEE MMM/d/yyyy"
    // returns jan/25/1876
    case literalShortMonthDayAndYear = "MMM/dd/yyyy"
    // returns 25/jan/1876
    case dayalphabeticalMonthAndYear = "dd/MMM/yyyy"
    
    case ISO8601 = "yyyy-MM-ddTHH:mm:ss.SSSZ"
}

public enum TimeFormat: String, CodingKey {
    // return 10:41
    case hourAndMinutes = "HH:mm"
    // return 10:41:02
    case hourMinutesSeconds = "HH:mm:ss"
    // return 10:41:02.112
    case hourMinutesSecondsAndMiliseconds = "HH:mm:ss.SSS"
    // return 10:41:25 PM
    case hourMinutesSecondsPMFormat = "HH:mm:ss a"
    // return 10:45 PM
    case hourAndMinutesPMFormat = "h:mm a"
    // returns 10:45:54 +0000
    case hourMinutesSecondsAndZ = "HH:mm:ss Z"
}

extension Date {
    static func dateFrom(customString: String, with dateFormat: DateFormat) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = dateFormat.rawValue
        return dateFormatter.date(from: customString) ?? Date()
    }
    
    static func getStringDate(from date: Date) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-ddTHH:mm:ss.SSSZ"
        return formatter.string(from: date)
    }
    
    static func getHour(from date: Date, withFormat timeFormat: TimeFormat) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = timeFormat.rawValue
        return formatter.string(from: date)
    }
    
    static func getStringDate(from date: Date, withFormat dateFormat: DateFormat) -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = dateFormat.rawValue
        return formatter.string(from: date)
    }
}


extension UIColor {
    
    static let pulsatingFillColor = UIColor.lightRgb(r: 255 , g: 0, b: 23)
    
    static let backgroudColor = UIColor.darkRgb(r: 39, g: 204, b: 255)
    
    static let sunColor = UIColor(hue: 45/360, saturation: 1, brightness: 1, alpha: 1)
    static let sunStrokeColor = UIColor(hue: 33/360, saturation: 1, brightness: 1, alpha: 1)
    static let sunTrackStrokeColor = UIColor(hue: 45/360, saturation: 0.76, brightness: 1, alpha: 1)
    
    static let moonColor = UIColor(hue: 49/360, saturation: 0.05, brightness: 0.27, alpha: 1)
    static let moonStrokeColor = UIColor(hue: 49/360, saturation: 0.05, brightness: 0.51, alpha: 1)
    static let moonTrackStrokeColor = UIColor(hue: 49/360, saturation: 0.05, brightness: 0.85, alpha: 1)
    
    
    static let facebookBackgroundColor = UIColor.darkRgb(r: 0, g: 96, b: 255)
    
    static let iconsContainerViewBackgroundColor = UIColor.darkRgb(r: 242, g: 248, b: 255)
    
    static func randomColor() -> UIColor {
        let r = CGFloat(drand48())
        let g = CGFloat(drand48())
        let b = CGFloat(drand48())
        return UIColor(red: r, green: g, blue: b, alpha: 1)
    }
    
    static func lightRgb(r:CGFloat, g:CGFloat, b:CGFloat) -> UIColor{
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 0.5)
    }
    
    static func darkRgb(r:CGFloat, g:CGFloat, b:CGFloat) -> UIColor{
        return UIColor(red: r/255, green: g/255, blue: b/255, alpha: 1)
    }
}

