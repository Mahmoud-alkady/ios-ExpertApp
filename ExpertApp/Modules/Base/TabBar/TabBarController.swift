//
//  TabBarController.swift
//  ExpertApp
//
//  Created by Mahmoud Alkady on 25/08/2022.
//

import UIKit

var TAB = TabBarController.shared

let didChangeProductCart = Notification.Name("didChangeProductCart")

class TabBarController: UITabBarController, UITabBarControllerDelegate {
    
    var icon1 = UITabBarItem()
    var icon2 = UITabBarItem()
    
    
    struct Static {
        static var instance: TabBarController?
    }
    
    class var shared: TabBarController {
        if Static.instance == nil {
            Static.instance = TabBarController()
        }
        return Static.instance!
    }
    
    func dispose() {
        TabBarController.Static.instance = nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.tintColor = .darkPurple
        tabBar.unselectedItemTintColor = .tortilla
        tabBar.barTintColor = .white
        tabBar.isTranslucent = false
        delegate = self
        if #available(iOS 15.0, *) {
            let appearance = UITabBarAppearance()
            appearance.configureWithOpaqueBackground()
            appearance.backgroundColor = .white
            tabBar.standardAppearance = appearance
            tabBar.scrollEdgeAppearance = tabBar.standardAppearance
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupView()
    }
    
    private func setupView() {
        let item1 = HomeView.assembleModule()
        let item2 = CartView.assembleModule()
        
        
        icon1 = UITabBarItem(title: "home", image: UIImage(named: "home"), selectedImage: UIImage(named: "home"))
        icon2 = UITabBarItem(title: "cart", image: UIImage(named: "cart"), selectedImage: UIImage(named: "cart"))
        
        
        icon1.titlePositionAdjustment = UIOffset(horizontal: 0.0, vertical: -2.0)
        icon2.titlePositionAdjustment = UIOffset(horizontal: 0.0, vertical: -2.0)
        
        
        item1.tabBarItem = icon1
        item2.tabBarItem = icon2
       
        
        let controllers = [item1, item2]
        self.viewControllers = controllers
        
        checkCartCount()
        NotificationCenter.default.addObserver(self, selector: #selector(checkCartCount), name: didChangeProductCart, object: nil)
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: didChangeProductCart, object: nil)
    }
    
    @objc func checkCartCount() {
        DispatchQueue.main.async {
            self.icon2.badgeColor = .darkPurple
            let cartCount = CART.carts.count
            if cartCount > 0 {
                self.icon2.badgeValue = "\(cartCount)"
            } else {
                self.icon2.badgeValue = nil
            }
        }
    }
}
