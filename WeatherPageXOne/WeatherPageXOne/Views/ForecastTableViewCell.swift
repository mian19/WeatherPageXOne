//
//  ForecastTableViewCell.swift
//  WeatherPageXOne
//
//  Created by Kyzu on 23.11.22.
//

import UIKit

class ForecastTableViewCell: UITableViewCell {

    static let id = "ForecastTableViewCell"
    
    var dayLabel: UILabel!
    var weatherImageView: UIImageView!
    var minTemperatureLabel: UILabel!
    var maxTemperatureLabel: UILabel!
    var dayForecast: Forecast!
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        backgroundColor = .clear
        selectionStyle = UITableViewCell.SelectionStyle.none
        setViews()
    }
    
    private func setViews() {
        setDayLabel()
        setWeatherImageView()
        setMinTemperatureLabel()
        setMaxTemperatureLabel()
    }
    
    private func setDayLabel() {
        dayLabel = UILabel.customLabel(fontSize: 18.adjustSize())
        addSubview(dayLabel)
        
        dayLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        dayLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 14.adjustSize()).isActive = true
        dayLabel.widthAnchor.constraint(equalToConstant: 75.adjustSize()).isActive = true
    }
    
    private func setWeatherImageView() {
        weatherImageView = UIImageView()
        weatherImageView.translatesAutoresizingMaskIntoConstraints = false
        weatherImageView.contentMode = .center
        addSubview(weatherImageView)
        
        weatherImageView.leadingAnchor.constraint(equalTo: dayLabel.trailingAnchor, constant: 31.adjustSize()).isActive = true
        weatherImageView.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        weatherImageView.widthAnchor.constraint(equalToConstant: 28.adjustSize()).isActive = true
        weatherImageView.heightAnchor.constraint(equalToConstant: 33.adjustSize()).isActive = true
    }
    
    private func setMinTemperatureLabel() {
        minTemperatureLabel = UILabel.customLabel(fontSize: 18.adjustSize(), alpha: 0.5, textAlignment: .right)
        addSubview(minTemperatureLabel)
        
        minTemperatureLabel.leadingAnchor.constraint(equalTo: weatherImageView.trailingAnchor, constant: 75.adjustSize()).isActive = true
        minTemperatureLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        minTemperatureLabel.widthAnchor.constraint(equalToConstant: 35.adjustSize()).isActive = true
        
    }
    
    private func setMaxTemperatureLabel() {
        maxTemperatureLabel = UILabel.customLabel(fontSize: 18.adjustSize(), textAlignment: .right)
        addSubview(maxTemperatureLabel)
        
        maxTemperatureLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12.adjustSize()).isActive = true
        maxTemperatureLabel.centerYAnchor.constraint(equalTo: centerYAnchor).isActive = true
        maxTemperatureLabel.widthAnchor.constraint(equalToConstant: 35.adjustSize()).isActive = true
    }
    
    func configure(_ dayForecast: Forecast) {
        dayLabel.text = dayForecast.date.dayFromDateString()
        weatherImageView.image = Image(rawValue: dayForecast.weather_type)?.image() ?? UIImage()
        minTemperatureLabel.text =  "\(dayForecast.min_temperature)°"
        maxTemperatureLabel.text = "\(dayForecast.max_temperature)°"
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
