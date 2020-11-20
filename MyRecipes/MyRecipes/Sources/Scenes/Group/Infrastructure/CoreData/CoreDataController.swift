//
//  CoreDataController.swift
//  MyRecipes
//
//  Created by Krygu on 20/11/2020.
//

import CoreData

class CoreDataController {
    private let persistentContainer = NSPersistentContainer(name: "MyRecipes")
    var context: NSManagedObjectContext {
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
    }
    
    func save(_ object: NSManagedObject) {
        context.insert(object)
        do {
            try context.save()
        } catch {
            print("error")
        }
    }
}
