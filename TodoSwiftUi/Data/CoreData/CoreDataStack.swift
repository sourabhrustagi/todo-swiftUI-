//
//  CoreDataStack.swift
//  TodoSwiftUi
//
//  Created by Sourabh Rustagi on 05/11/24.
//

import CoreData

class CoreDataStack {
    static let shared = CoreDataStack()
    let persistentContainer: NSPersistentContainer

    private init() {
        persistentContainer = NSPersistentContainer(name: "TodoModel") // Ensure name matches .xcdatamodeld
        persistentContainer.loadPersistentStores { _, error in
            if let error = error {
                fatalError("Core Data stack could not be loaded: \(error)")
            }
        }
    }
    
    var context: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
}
