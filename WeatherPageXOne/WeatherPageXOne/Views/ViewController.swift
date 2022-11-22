//
//  ViewController.swift
//  WeatherPageXOne
//
//  Created by Kyzu on 21.11.22.
//

import UIKit

class ViewController: UIViewController {
    
    private var cityLabel: UILabel!
    private var currentWeatherLabel: UILabel!
    private var thisDayWeatherTable: ThisDayTableView!
    private var forecastWeatherTable: ForecastTableView!
    private var testData: JSONResponse!
    private let presenter = Presenter()
    weak private var viewOutputDelegate: ViewOutputDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setViews()
        setRelationsWithPresenter()
        self.viewOutputDelegate?.getData()
        displayData()
    }
    
    private func setRelationsWithPresenter() {
        presenter.setViewInputDelegate(viewInputDelegate: self)
        self.viewOutputDelegate = presenter
    }
    
    private func setViews() {
        view.addBackground()
        setCityLabel()
        setCurrentWeatherLabel()
        setThisDayWeatherTable()
        setForecastWeatherTable()
    }
    
    private func setCityLabel() {
        cityLabel = UILabel.customLabel(fontSize: 36.adjustSize())
        view.addSubview(cityLabel)
        
        cityLabel.widthAnchor.constraint(equalToConstant: 130.adjustSize()).isActive = true
        cityLabel.heightAnchor.constraint(equalToConstant: 36.adjustSize()).isActive = true
        cityLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        cityLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 60.adjustSize()).isActive = true
    }
    
    private func setCurrentWeatherLabel() {
        currentWeatherLabel = UILabel.customLabel(fontSize: 20.adjustSize(), alpha: 0.6)
        view.addSubview(currentWeatherLabel)
        
        currentWeatherLabel.widthAnchor.constraint(equalToConstant: 130.adjustSize()).isActive = true
        currentWeatherLabel.heightAnchor.constraint(equalToConstant: 20.adjustSize()).isActive = true
        currentWeatherLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        currentWeatherLabel.topAnchor.constraint(equalTo: cityLabel.bottomAnchor, constant: 7.adjustSize()).isActive = true
    }
    
    private func setThisDayWeatherTable() {
        thisDayWeatherTable = ThisDayTableView()
        view.addSubview(thisDayWeatherTable)
        
        thisDayWeatherTable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24.adjustSize()).isActive = true
        thisDayWeatherTable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24.adjustSize()).isActive = true
        thisDayWeatherTable.heightAnchor.constraint(equalToConstant: 180.adjustSize()).isActive = true
        thisDayWeatherTable.topAnchor.constraint(equalTo: currentWeatherLabel.bottomAnchor, constant: 57.adjustSize()).isActive = true
    }
    
    private func setForecastWeatherTable() {
        forecastWeatherTable = ForecastTableView()
        view.addSubview(forecastWeatherTable)
        
        forecastWeatherTable.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24.adjustSize()).isActive = true
        forecastWeatherTable.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24.adjustSize()).isActive = true
        forecastWeatherTable.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -18.adjustSize()).isActive = true
        forecastWeatherTable.topAnchor.constraint(equalTo: thisDayWeatherTable.bottomAnchor, constant: 9.adjustSize()).isActive = true
    }
    
    //MARK: - set white status bar
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
}

extension ViewController: ViewInputDelegate {
    func displayData() {
        cityLabel.text = testData.city
        cityLabel.setCharacterSpacing(3)
        currentWeatherLabel.text = testData.temperature
        thisDayWeatherTable.textForFirstCell = testData.description
        thisDayWeatherTable.thisDayWeatherArray = testData.weather_per_day
        forecastWeatherTable.forecast = testData.forecast
    }
    
    func setupData(testData: JSONResponse) {
        self.testData = testData
    }
}

