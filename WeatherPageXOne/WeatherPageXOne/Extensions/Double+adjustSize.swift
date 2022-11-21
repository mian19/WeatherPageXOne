//
//  Double+adjustSize.swift
//  WeatherPageXOne
//
//  Created by Kyzu on 21.11.22.
//

import UIKit

extension Double {
    
    func adjustSize() -> Double {
        let iPhone13ProMaxScreenWidth = 428 / self
        return UIScreen.main.bounds.width / iPhone13ProMaxScreenWidth
    }
}
