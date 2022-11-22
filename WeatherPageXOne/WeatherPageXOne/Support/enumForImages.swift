//
//  enumForImages.swift
//  WeatherPageXOne
//
//  Created by Kyzu on 22.11.22.
//

import UIKit

enum Image: String {
    case cloud, snow, sunset
}

extension Image {
    func image() -> UIImage {
        return UIImage(named: self.rawValue) ?? UIImage()
    }
}
