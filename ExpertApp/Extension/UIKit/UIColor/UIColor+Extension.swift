//
//  UIColor+Extension.swift
//  ExpertApp
//
//  Created by Mahmoud Alkady on 25/08/2022.
//

import UIKit

extension UIColor {

    static let tortilla = UIColor(hex: 0xC6A87D)
    static let darkPurple = UIColor(hex: 0x2D103E)
    
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: a)
    }
    
    convenience init(hex: Int, a: CGFloat = 1.0) {
        self.init(red: (hex >> 16) & 0xFF, green: (hex >> 8) & 0xFF, blue: hex & 0xFF, a: a)
    }
}
