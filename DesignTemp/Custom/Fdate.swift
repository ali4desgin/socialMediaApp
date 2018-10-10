//
//  Fdate.swift
//  DesignTemp
//
//  Created by MAC on 10/7/18.
//  Copyright © 2018 app. All rights reserved.
//

import UIKit
class Fdate: NSDate {

    static func formatDate(date:String) ->  Date {
        
        let formatter = DateFormatter()
        formatter.dateFormat = "h:m a"
        
        if formatter.date(from: date) != nil {
            return formatter.date(from: date)!
        }
        
        return Date()
        
    }
}
