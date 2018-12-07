//
//  CoreDataManager.swift
//  buh
//
//  Created by Пользователь on 07/12/2018.
//  Copyright © 2018 Пользователь. All rights reserved.
//

import UIKit
import CoreData

class CoreDataManager: NSObject {

    static var persistentContainer: NSPersistentContainer = {

        let container = NSPersistentContainer(name: "BuhDB")
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {

                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
        return container
    }()
    
    // MARK: - Core Data Saving support
    
    static func saveContext () {
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

    
}
