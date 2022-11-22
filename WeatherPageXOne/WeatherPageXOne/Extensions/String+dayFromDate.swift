//
//  String+dayFromDate.swift
//  WeatherPageXOne
//
//  Created by Kyzu on 23.11.22.
//

import Foundation

extension String {

    func dayFromDateString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "dd.MM.yyy"
        formatter.locale = Locale(identifier: "ru_RU")
        guard let date = formatter.date(from: self) else {
            return ""
        }
        
        formatter.dateFormat = "EE"
        let dayInWeek = formatter.string(from: date).capitalized
        return dayInWeek
    }
}
