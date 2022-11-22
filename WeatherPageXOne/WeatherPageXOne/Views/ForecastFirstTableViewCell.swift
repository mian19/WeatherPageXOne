//
//  ForecastFirstTableViewCell.swift
//  WeatherPageXOne
//
//  Created by Kyzu on 23.11.22.
//

import UIKit

class ForecastFirstTableViewCell: UITableViewCell {

    static let id = "ForecastFirstTableViewCell"
    private var calendarImage: UIImageView!
    private var label: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = UITableViewCell.SelectionStyle.none
        setCalendarImage()
        setLabel()
    }
    
    private func setCalendarImage() {
        calendarImage = UIImageView()
        addSubview(calendarImage)
        calendarImage.translatesAutoresizingMaskIntoConstraints = false
        calendarImage.image = UIImage(named: "calendar")
        
        calendarImage.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        calendarImage.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16.adjustSize()).isActive = true
    }
    
    private func setLabel() {
        label = UILabel.customLabel(text: "10-DAY FORECAST", fontSize: 17.adjustSize(), alpha: 0.4)
        addSubview(label)
        
        label.leadingAnchor.constraint(equalTo: calendarImage.trailingAnchor, constant: 7.adjustSize()).isActive = true
        label.centerYAnchor.constraint(equalTo: calendarImage.centerYAnchor).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    


}
