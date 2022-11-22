//
//  ThisDayTableView.swift
//  WeatherPageXOne
//
//  Created by Kyzu on 21.11.22.
//

import UIKit

class ThisDayTableView: UITableView {
    
    private var reuseID = "reuseID"
    var textForFirstCell = ""
    var thisDayWeatherArray = [WeatherPerDay]()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        register(ThisDayFirstTableViewCell.self, forCellReuseIdentifier: ThisDayFirstTableViewCell.id)
        register(ThisDaySecondTableViewCell.self, forCellReuseIdentifier: ThisDaySecondTableViewCell.id)
        translatesAutoresizingMaskIntoConstraints = false
        backgroundColor = UIColor(red: 0.235, green: 0.306, blue: 0.396, alpha: 0.6)
        layer.cornerRadius = 14
        clipsToBounds = true
        separatorColor = UIColor(red: 0.4314, green: 0.4706, blue: 0.5294, alpha: 1.0)
        separatorInset = UIEdgeInsets(top: 0, left: 14.adjustSize(), bottom: 0, right: 14.adjustSize())
        isScrollEnabled = false
        delegate = self
        dataSource = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ThisDayTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            if let cell = dequeueReusableCell(withIdentifier: ThisDayFirstTableViewCell.id, for: indexPath) as? ThisDayFirstTableViewCell {
                cell.label.text = textForFirstCell
                return cell
            }
        } else {
            if let cell = dequeueReusableCell(withIdentifier: ThisDaySecondTableViewCell.id, for: indexPath) as? ThisDaySecondTableViewCell {
                cell.collectionView.thisDayWeatherArray = self.thisDayWeatherArray
                return cell
            }
        }
        
        return  UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        if indexPath.row == 0 {
            return 64.adjustSize()
        } else {
            return 116.adjustSize()
        }
    }
}
