//
//  Date+Element.swift
//  Aweh
//
//  Created by Divine.Dube on 2020/06/20.
//  Copyright © 2020 com.github.aweh. All rights reserved.
//

import Foundation

extension Date {
     func relativeDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = .none
        dateFormatter.dateStyle = .medium
        dateFormatter.locale = Locale.current
        dateFormatter.doesRelativeDateFormatting = true
        return dateFormatter.string(from: self)
    }
    
    static func fromString(string: String) -> Date {
        
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX")
        dateFormatter.dateFormat = "yyyy-MM-dd"
        guard let date = dateFormatter.date(from: string) else {
            Logger.log("Could not parse string date to Date")
            return Date()
        }
        return date
    }
}
