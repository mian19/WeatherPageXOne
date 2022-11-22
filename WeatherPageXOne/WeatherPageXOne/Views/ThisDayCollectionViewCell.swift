//
//  ThisDayCollectionViewCell.swift
//  WeatherPageXOne
//
//  Created by Kyzu on 22.11.22.
//

import UIKit

class ThisDayCollectionViewCell: UICollectionViewCell {
   
    static let id = "ThisDayCollectionViewCell"
    var timeLabel: UILabel!
    var imageView: UIImageView!
    var temperatureLabel: UILabel!
    var weatherInAHour: WeatherPerDay!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setViews()
    }
    
    private func setViews() {
        setTimeLabel()
        setImageView()
        setTemperatureLabel()
    }
    
    private func setTimeLabel() {
        timeLabel = UILabel.customLabel(fontSize: 16.adjustSize())
        timeLabel.textAlignment = .center
        addSubview(timeLabel)
        
        timeLabel.topAnchor.constraint(equalTo: topAnchor).isActive = true
        timeLabel.leadingAnchor.constraint(equalTo: leadingAnchor).isActive = true
        timeLabel.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        timeLabel.heightAnchor.constraint(equalToConstant: 17.adjustSize()).isActive = true
    }
    
    private func setImageView() {
        imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        addSubview(imageView)
        
        imageView.topAnchor.constraint(equalTo: timeLabel.bottomAnchor, constant: 3.adjustSize()).isActive = true
        imageView.centerXAnchor.constraint(equalTo: timeLabel.centerXAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 28.adjustSize()).isActive = true
        imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor).isActive = true
    }
    
    private func setTemperatureLabel() {
        temperatureLabel = UILabel.customLabel(fontSize: 19.adjustSize())
        temperatureLabel.textAlignment = .center
        addSubview(temperatureLabel)
        
        temperatureLabel.centerXAnchor.constraint(equalTo: centerXAnchor).isActive = true
        temperatureLabel.topAnchor.constraint(equalTo: imageView.bottomAnchor, constant: 13.adjustSize()).isActive = true
        temperatureLabel.heightAnchor.constraint(equalToConstant: 20.adjustSize()).isActive = true
        temperatureLabel.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
    }
    
    func configure(_ weatherInAHour: WeatherPerDay) {
        timeLabel.text = weatherInAHour.timestamp
        imageView.image = Image(rawValue: weatherInAHour.weather_type)?.image() ?? UIImage()
        temperatureLabel.text =  weatherInAHour.temperature !=  "Заход солнца" ? weatherInAHour.temperature + "°" : weatherInAHour.temperature; temperatureLabel.setCharacterSpacing(2)
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
