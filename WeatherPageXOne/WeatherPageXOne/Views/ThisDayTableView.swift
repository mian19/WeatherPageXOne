//
//  ThisDayTableView.swift
//  WeatherPageXOne
//
//  Created by Kyzu on 21.11.22.
//

import UIKit

class ThisDayTableView: UITableView {
    
    var textForFirstCell = ""
    var thisDayWeatherArray = [WeatherPerDay]()
    
    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        register(ThisDayFirstTableViewCell.self, forCellReuseIdentifier: ThisDayFirstTableViewCell.id)
        register(ThisDaySecondTableViewCell.self, forCellReuseIdentifier: ThisDaySecondTableViewCell.id)
        delegate = self
        dataSource = self
        isScrollEnabled = false
        setCustomStyle()
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
