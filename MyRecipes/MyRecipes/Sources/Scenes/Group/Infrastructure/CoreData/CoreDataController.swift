//
//  CoreDataController.swift
//  MyRecipes
//
//  Created by Krygu on 20/11/2020.
//

import CoreData

class CoreDataController {    
    var updateDelegates: [() -> Void] = []

    private let persistentContainer = NSPersistentContainer(name: "MyRecipes")
    public var context: NSManagedObjectContext {
        return self.persistentContainer.viewContext
    }
    
    private func initalizeStack() {
        self.persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                print("Could not load store \(error.localizedDescription)")
                return
            }
            print("Store loaded")
        }
    }
    
    init() {
        initalizeStack()
        let notificationCenter = NotificationCenter.default
        notificationCenter.addObserver(self, selector: #selector(managedObjectContextObjectsDidChange), name: NSNotification.Name.NSManagedObjectContextObjectsDidChange, object: context)
    }
    
    func save(_ object: NSManagedObject) {
        context.insert(object)
        do {
            try context.save()
        } catch {
            print("error")
        }
    }
    
    @objc func managedObjectContextObjectsDidChange(notification: NSNotification) {
        guard let userInfo = notification.userInfo else { return }
        
        if let updates = userInfo[NSUpdatedObjectsKey] as? Set<NSManagedObject>, updates.count > 0 {
            print("updates")
            print(updates)
            updateDelegates.forEach { $0() }
        }
    }
}
