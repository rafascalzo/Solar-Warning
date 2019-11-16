//
//  Extensions.swift
//  Solar Warning
//
//  Created by rafaeldelegate on 11/15/19.
//  Copyright © 2019 rafaeldelegate. All rights reserved.
//

import Foundation
import UIKit

extension UIColor {
        
    static func randomColor() -> UIColor {
        let r = CGFloat(drand48())
        let g = CGFloat(drand48())
        let b = CGFloat(drand48())
        return UIColor(red: r, green: g, blue: b, alpha: 1)
    }
}

extension Date {
    static func dateFrom(customString: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-ddTHH:mm:ss.SSSZ"
        return dateFormatter.date(from: customString) ?? Date()
    }
    
    static func getStringDate(from date: Date) -> String {
           let formatter = DateFormatter()
           formatter.dateFormat = "yyyy-MM-ddTHH:mm:ss.SSSZ"
           return formatter.string(from: date)
       }
}
