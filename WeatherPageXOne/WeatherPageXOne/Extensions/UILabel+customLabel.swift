//
//  UILabel+customLabel.swift
//  WeatherPageXOne
//
//  Created by Kyzu on 21.11.22.
//


import UIKit

extension UILabel {
    static func customLabel(text: String = "", fontSize: CGFloat, alpha: Double = 1, textAlignment: NSTextAlignment = .left, characterSpacing: CGFloat = 0) -> UILabel {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: fontSize, weight: .medium)
        label.adjustsFontSizeToFitWidth = true
        label.translatesAutoresizingMaskIntoConstraints = false
        label.textColor = UIColor(red: 1, green: 1, blue: 1, alpha: alpha)
        label.textAlignment = textAlignment
        label.text = text
        return label
    }
    
    func setCharacterSpacing(_ spacing: CGFloat){
          let attributedStr = NSMutableAttributedString(string: self.text ?? "")
          attributedStr.addAttribute(NSAttributedString.Key.kern, value: spacing, range: NSMakeRange(0, attributedStr.length))
          self.attributedText = attributedStr
       }
}
