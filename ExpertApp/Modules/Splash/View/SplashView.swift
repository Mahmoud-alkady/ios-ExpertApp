//
//  SplashView.swift
//  ExpertApp
//
//  Created by Mahmoud Alkady on 25/08/2022.
//

import UIKit

class SplashView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.presentHome()
        }

            }
    override func viewWillAppear(_ animated: Bool) {
    }

   

}
extension SplashView{
    
    func presentHome(){
        TAB.selectedIndex = 0
        let appDlg = UIApplication.shared.delegate as? AppDelegate
        appDlg?.window?.rootViewController = TAB
    }
    
    // Assemble Module
   
        static func assembleModule() -> UIViewController {
            let view: SplashView = UIStoryboard(name: "SplashView", bundle: nil).instantiateViewController(withIdentifier: "SplashView") as! SplashView
            return view
    }
        
    
    
}
