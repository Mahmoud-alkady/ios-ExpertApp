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
    static let goldRate = UIColor(hex: 0xffaa56)
    static let transparent = UIColor(hex: 0x000000, a: 0.6)
    static let bottomGrayLine = UIColor(hex: 0xD3D3D3)
    static let topBorderColor = UIColor(hex: 0x707070, a: 0.16)
    static let blueColor = UIColor(hex: 0x628BFA)
    static let successColor = UIColor(hex: 0x4BB543)
    
    convenience init(red: Int, green: Int, blue: Int, a: CGFloat = 1.0) {
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: a)
    }
    
    convenience init(hex: Int, a: CGFloat = 1.0) {
        self.init(red: (hex >> 16) & 0xFF, green: (hex >> 8) & 0xFF, blue: hex & 0xFF, a: a)
    }
}
