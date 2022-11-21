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
                return jsonResponse
            }
        } catch {
            print(error)
        }
        return nil
    }
}
