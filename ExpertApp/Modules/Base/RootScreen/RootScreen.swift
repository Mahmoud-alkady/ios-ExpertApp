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
        
        if APP.hasAlreadyLaunched == false {
           
            APP.sethasAlreadyLaunched()
        }
        window.rootViewController = SplashView.assembleModule()
    }
    
//    func resetApp() {
//        let vc = SplashView.assembleModule()
//        rootVC(vc)
//    }
    
  
    
//    func rootVC(_ vc: UIViewController) {
//        let appDlg = UIApplication.shared.delegate as? AppDelegate
//        appDlg?.window?.rootViewController = vc
//    }
}

