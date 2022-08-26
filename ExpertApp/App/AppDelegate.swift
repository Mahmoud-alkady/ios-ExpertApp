//
//  AppDelegate.swift
//  ExpertApp
//
//  Created by Mahmoud Alkady on 25/08/2022.
//

import UIKit
import CoreData
let APP = UIApplication.shared.delegate! as! AppDelegate
@main
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var hasAlreadyLaunched :Bool!
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        print("Documents Directory: ", FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).last ?? "Not Found!")
        deleteUser()
        setupTabbar()
        presentRootScreen()
        return true
    }
    
    fileprivate func setupTabbar() {
        
        UITabBarItem.appearance().setTitleTextAttributes([NSAttributedString.Key.foregroundColor: UIColor.blue ], for: .normal)
    }
    
    func deleteUser() {
        hasAlreadyLaunched = UserDefaults.standard.bool(forKey: "hasAlreadyLaunched")
        if (hasAlreadyLaunched) {
            hasAlreadyLaunched = true
        } else {
            UserDefaults.standard.set(true, forKey: "hasAlreadyLaunched")
        }
    }
    
    func sethasAlreadyLaunched(){
        hasAlreadyLaunched = true
    }
    
    fileprivate func presentRootScreen() {
        window = UIWindow(frame: UIScreen.main.bounds)
        Rootscreen().presentRootScreen(in: window!)
    }
    
    // MARK: - Core Data stack
    
    lazy var persistentContainer: NSPersistentCloudKitContainer = {
        /*
         The persistent container for the application. This implementation
         creates and returns a container, having loaded the store for the
         application to it. This property is optional since there are legitimate
         error conditions that could cause the creation of the store to fail.
         */
        let container = NSPersistentCloudKitContainer(name: "ExpertApp")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                
                /*
                 Typical reasons for an error here include:
                 * The parent directory does not exist, cannot be created, or disallows writing.
                 * The persistent store is not accessible, due to permissions or data protection when the device is locked.
                 * The device is out of space.
                 * The store could not be migrated to the current model version.
                 Check the error message to determine what the actual problem was.
                 */
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    
}

