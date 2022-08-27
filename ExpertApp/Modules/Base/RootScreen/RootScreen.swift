//
//  RootScreen.swift
//  ExpertApp
//
//  Created by Mahmoud Alkady on 25/08/2022.
//

import UIKit

class Rootscreen {
    
    func presentRootScreen(in window: UIWindow) {
        window.makeKeyAndVisible()
        window.rootViewController = SplashView.assembleModule()
    }
}

