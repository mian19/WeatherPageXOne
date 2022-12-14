//
//  ViewInputDelegateProtocol.swift
//  WeatherPageXOne
//
//  Created by Kyzu on 21.11.22.
//

import Foundation

protocol ViewInputDelegate: AnyObject {
    func setupData(testData: JSONResponse)
    func displayData()
}
