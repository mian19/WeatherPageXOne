//
//  JSONManager.swift
//  WeatherPageXOne
//
//  Created by Kyzu on 21.11.22.
//

import Foundation

class JSONManager {
    
    static var shared = JSONManager()
    private init() {}
    
    func fetchingInformation(for resource: String) -> JSONResponse? {
        guard let path = Bundle.main.path(forResource: resource, ofType: "json") else { return nil}
        let url = URL(fileURLWithPath: path)
        
        do {
            let jsonData = try Data(contentsOf: url)
            let jsonResponse: JSONResponse? = try JSONDecoder().decode(JSONResponse.self, from: jsonData)
            
            if let jsonResponse = jsonResponse {
                let updatedResponse = updatingResponse(data: jsonResponse)
                return updatedResponse
            }
        } catch {
            print(error)
        }
        return nil
    }
    
    private func updatingResponse(data: JSONResponse)  -> JSONResponse {
        var updatedResponse = data
        addCurrentWeatherOfThisDay(&updatedResponse)
        findSunset(&updatedResponse)
       return updatedResponse
    }
    
    private func addCurrentWeatherOfThisDay(_ updatedResponse: inout JSONResponse) {
        updatedResponse.weather_per_day.insert(WeatherPerDay(timestamp: "Сейчас", weather_type: "cloud", temperature: "-4", sunset: nil), at: 0)
    }
    
    private func findSunset(_ updatedResponse: inout JSONResponse)  {
        for (index, value) in updatedResponse.weather_per_day.enumerated() {
            if value.sunset == true {
                updatedResponse.weather_per_day.insert(WeatherPerDay(timestamp: value.timestamp, weather_type: "sunset", temperature: "Заход солнца", sunset: nil), at: index+1)
            }
        }
    }
}
