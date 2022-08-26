//
//  UIView+Corners.swift
//  ExpertApp
//
//  Created by Mahmoud Alkady on 25/08/2022.
//

import UIKit

extension UIView {
    
    func roundCorners(_ corners: UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.cgPath
        self.layer.mask = mask
    }
    
    func conrnerRadiusRL(_ view: UIView){
            view.roundCorners([.bottomLeft, .topLeft], radius: 10)
        }
    }
    
  
    
    func cornerRadiusTop(_ view: UIView, _ radius: CGFloat? = 10){
        view.roundCorners([.topRight, .topLeft], radius: radius!)
    }
    
    func conrnerRadiusView(_ view: UIView){
        view.layer.cornerRadius = 10
                    view.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMaxYCorner]
       
    }

    func conrnerRadiusTop(_ view: UIView, _ radius: CGFloat? = 10){
        view.layer.cornerRadius = radius!
        view.layer.maskedCorners = [.layerMinXMinYCorner,.layerMaxXMinYCorner]
    }

