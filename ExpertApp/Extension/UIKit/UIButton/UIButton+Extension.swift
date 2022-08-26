//
//  UIButton+Extension.swift
//  ExpertApp
//
//  Created by Mahmoud Alkady on 25/08/2022.
//

import UIKit

extension UIButton {
    
    @IBInspectable var imageViewContentType: Int {
        get {
            return imageView?.contentMode.rawValue ?? 0
        }
        set {
            if let content = UIView.ContentMode(rawValue: newValue), imageView != nil {
                imageView!.contentMode =  content
            }
        }
    }
    
    /**
     This method is used to create the default button styple for the application
     
     - parameter color: The color of backgroud and by default it is the primary color
     - parameter titleKey: The key localized to be a title of button with .normal style
     */
    func btnDefault(color: UIColor? = .darkPurple, titleKey: String? = nil) {
        self.backgroundColor = color
        self.layer.shadowColor = UIColor(red: 0/255.0 , green: 0/255.0, blue: 0/255.0, alpha: 0.47).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowRadius = 3
        self.layer.shadowOpacity = 1
        self.layer.cornerRadius = 6
      
    }
    
    func btnDefaultWithBorder(color: UIColor? = .darkPurple, titleKey: String? = nil) {
        self.layer.borderColor = color!.cgColor
        self.layer.borderWidth = 1
        self.backgroundColor = .clear
        self.layer.cornerRadius = 6
    }
    
    func shadow() {
        self.backgroundColor = .tortilla
        self.layer.shadowColor = UIColor(red: 152/255.0 , green: 107/255.0, blue: 72/255.0, alpha: 0.47).cgColor
        self.layer.shadowOffset = CGSize(width: 0, height: 3)
        self.layer.shadowRadius = 2
        self.layer.shadowOpacity = 1
        self.layer.masksToBounds = false
        self.layer.cornerRadius = 5
    }
    
    func underLine(title: String) {
        let attrs = [NSAttributedString.Key.font : self.titleLabel!.font!,
                     NSAttributedString.Key.foregroundColor : self.titleColor(for: .normal)!,
                     NSAttributedString.Key.underlineStyle : 1] as [NSAttributedString.Key : Any]
        let attributedString = NSMutableAttributedString(string: "")
        let buttonTitleStr = NSMutableAttributedString(string: title, attributes:attrs)
        attributedString.append(buttonTitleStr)
        self.setAttributedTitle(attributedString, for: .normal)
    }
}
