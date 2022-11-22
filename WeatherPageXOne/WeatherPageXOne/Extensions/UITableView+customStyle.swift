//
//  UITableView+customStyle.swift
//  WeatherPageXOne
//
//  Created by Kyzu on 23.11.22.
//

import UIKit

extension UITableView {
    func setCustomStyle() {
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor(red: 0.235, green: 0.306, blue: 0.396, alpha: 0.6)
        layer.cornerRadius = 14
        clipsToBounds = true
        showsVerticalScrollIndicator = false
        separatorColor = UIColor(red: 0.4314, green: 0.4706, blue: 0.5294, alpha: 1.0)
        separatorInset = UIEdgeInsets(top: 0, left: 14.adjustSize(), bottom: 0, right: 14.adjustSize())
    }
}
