//
//  JSONResponse.swift
//  WeatherPageXOne
//
//  Created by Kyzu on 21.11.22.
//

import Foundation

struct JSONResponse: Codable {
    let city, temperature, description: String
    var weather_per_day: [WeatherPerDay]
    let forecast: [Forecast]
}

// MARK: - Forecast
struct Forecast: Codable {
    let date: String
    let min_temperature, max_temperature: Int
    let weather_type: String
}

// MARK: - WeatherPerDay
struct WeatherPerDay: Codable {
    let timestamp, weather_type, temperature: String
    let sunset: Bool?
}
