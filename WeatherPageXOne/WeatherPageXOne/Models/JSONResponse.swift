//
//  JSONResponse.swift
//  WeatherPageXOne
//
//  Created by Kyzu on 21.11.22.
//

import Foundation

struct JSONResponse: Codable {
    let city, temperature, description: String
    let weatherPerDay: [WeatherPerDay]
    let forecast: [Forecast]

    enum CodingKeys: String, CodingKey {
        case city, temperature, description
        case weatherPerDay = "weather_per_day"
        case forecast
    }
}

// MARK: - Forecast
struct Forecast: Codable {
    let date: String
    let minTemperature, maxTemperature: Int
    let weatherType: String

    enum CodingKeys: String, CodingKey {
        case date
        case minTemperature = "min_temperature"
        case maxTemperature = "max_temperature"
        case weatherType = "weather_type"
    }
}

// MARK: - WeatherPerDay
struct WeatherPerDay: Codable {
    let timestamp, weatherType, temperature: String
    let sunset: Bool?

    enum CodingKeys: String, CodingKey {
        case timestamp
        case weatherType = "weather_type"
        case temperature, sunset
    }
}
