//
//  ThisDayFirstTableViewCell.swift
//  WeatherPageXOne
//
//  Created by Kyzu on 21.11.22.
//

import UIKit

class ThisDayFirstTableViewCell: UITableViewCell {
    
    static let id = "ThisDayFirstTableViewCell"
    var label: UILabel!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = UITableViewCell.SelectionStyle.none
        setLabel()
    }
    
    private func setLabel() {
        label = UILabel.customLabel(fontSize: 15.adjustSize())
        label.numberOfLines = 2
        label.text = "rgreger"
        addSubview(label)
        
        label.topAnchor.constraint(equalTo: topAnchor, constant: 14.adjustSize()).isActive = true
        label.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14.adjustSize()).isActive = true
        label.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -40.adjustSize()).isActive = true
        label.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -14.adjustSize()).isActive = true
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
