//
//  AppDelegate.swift
//  Affect
//
//  Created by Stephanie on 3/17/20.
//  Copyright © 2020 Stephanie Chiu. All rights reserved.
//

import UIKit
import CoreData

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        return true
    }

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }
    
    func applicationWillTerminate(_ application: UIApplication) {
        self.save()
    }
    
        // MARK: - Core Data stack

        lazy var persistentContainer: NSPersistentContainer = {
            
            let container = NSPersistentContainer(name: "Affect")
                container.loadPersistentStores(completionHandler: { (storeDescription, error) in
                    if let error = error as NSError? {

                        fatalError("Unresolved error \(error), \(error.userInfo)")
                    }
                })
                return container
            }()

        // MARK: - Core Data Saving support

        func save() {
            let context = persistentContainer.viewContext
            if context.hasChanges {
                do {
                    try context.save()
                } catch {
                    let nserror = error as NSError
                    fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
                }
            }
        }
        
//        //Returns the object type passed in as an array
//        func fetch<T: NSManagedObject>(_ objectType: T.Type) -> [T] {
//            let entityName = String(describing: objectType)
//            let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: entityName)
//            
//            do {
//                let fetchedObjects = try context.fetch(fetchRequest) as? [T]
//                return fetchedObjects ?? [T]()
//            } catch {
//                print(error)
//                return [T]() //Returns empty array
//            }
//        }
//        
//        func delete(_ object: NSManagedObject) {
//            context.delete(object)
//            save()
//        }

}

