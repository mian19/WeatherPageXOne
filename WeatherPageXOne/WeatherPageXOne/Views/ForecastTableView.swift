//
//  ForecastTableView.swift
//  WeatherPageXOne
//
//  Created by Kyzu on 23.11.22.
//

import UIKit

class ForecastTableView: UITableView {

    var forecast = [Forecast]()

    override init(frame: CGRect, style: UITableView.Style) {
        super.init(frame: frame, style: style)
        register(ForecastFirstTableViewCell.self, forCellReuseIdentifier: ForecastFirstTableViewCell.id)
        register(ForecastTableViewCell.self, forCellReuseIdentifier: ForecastTableViewCell.id)
        delegate = self
        dataSource = self
        setCustomStyle()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

extension ForecastTableView: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       forecast.count + 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if indexPath.row == 0 {
            if let cell = dequeueReusableCell(withIdentifier: ForecastFirstTableViewCell.id, for: indexPath) as? ForecastFirstTableViewCell {
                
                return cell
            }
        } else {
            if let cell = dequeueReusableCell(withIdentifier: ForecastTableViewCell.id, for: indexPath) as? ForecastTableViewCell {
                if forecast.count > indexPath.row {
                    cell.configure(forecast[indexPath.row])
                }
                if indexPath.row == 1 {
                    cell.dayLabel.text = "Сегодня"
                }
                return cell
            }
        }
        
        return  UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 50.adjustSize()
    }
}
