//
//  Persistence.swift
//  PizzaRestaurant
//
//  Created by Andreas Schultz on 25.09.20.
//
import CoreData
import UIKit


// As Core Data wasnt Initially loaded in, the Hacking with Swift Tutorial was used as a reference to create a new persistence file
// https://www.hackingwithswift.com/quick-start/swiftui/introduction-to-using-core-data-with-swiftui

struct PersistenceController {
    static let shared = PersistenceController()
    
    func save() {
        let context = container.viewContext

        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Show some error here
            }
        }
    }

    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        for _ in 0..<10 {
            let newItem = Drawing(context: viewContext)
            // Adding to the viewcontext example objects, for preview pruposes
            newItem.img = Data()
            newItem.date = "02081999"
        }
        do {
            try viewContext.save()
        } catch {
            
            let nsError = error as NSError
            fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
        }
        return result
    }()

    let container: NSPersistentContainer

    init(inMemory: Bool = false) {
        container = NSPersistentContainer(name: "DrawDaily")
        if inMemory {
            container.persistentStoreDescriptions.first?.url = URL(fileURLWithPath: "/dev/null")
        }
        container.loadPersistentStores(completionHandler: { (storeDescription, error) in
            if let error = error as NSError? {
                
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        })
    }
}
