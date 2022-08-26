//
//  EmptyScreen+Entity.swift
//  ExpertApp
//
//  Created by Mahmoud Alkady on 26/08/2022.
//

import Foundation

enum EmptyScreenType {
    
    case cart
}

@objc protocol EmptyScreenControllerDelegate {
    @objc optional func didClickEmptyScreenBtn()
}
