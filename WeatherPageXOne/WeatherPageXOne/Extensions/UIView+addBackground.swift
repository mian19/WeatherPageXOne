//
//  UIView+addBackground.swift
//  WeatherPageXOne
//
//  Created by Kyzu on 21.11.22.
//

import UIKit
extension UIView {
    func addBackground(name: String = "background") {
        let width = UIScreen.main.bounds.size.width
        let height = UIScreen.main.bounds.size.height
        
        let imageViewBackground = UIImageView(frame: CGRect(x: 0, y: 0, width: width, height: height))
        imageViewBackground.image = UIImage(named: name)
        
        imageViewBackground.contentMode = .scaleAspectFill
        
        self.addSubview(imageViewBackground)
        self.sendSubviewToBack(imageViewBackground)
    }
}
