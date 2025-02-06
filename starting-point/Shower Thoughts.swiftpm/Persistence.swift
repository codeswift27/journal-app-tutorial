//
//  Persistence.swift
//  Shower Thoughts
//
//  Created by Lexline Johnson on 2/4/25.
//

import SwiftUI
import CoreData

class Persistence {
    @MainActor static let shared = Persistence()
    
    let container: NSPersistentContainer
    
    init(inMemory: Bool = false) {
        // Create Thought entity
        let thoughtEntity = NSEntityDescription()
        thoughtEntity.name = "Thought"
        thoughtEntity.managedObjectClassName = "Thought"
        
        // Add attributes to the entity here
        
        let model = NSManagedObjectModel()
        model.entities = [thoughtEntity]
        
        let container = NSPersistentContainer(name: "Model", managedObjectModel: model)
        
        if inMemory {
            container.persistentStoreDescriptions.first!.url = URL(fileURLWithPath: "/dev/null")
        }
        
        container.loadPersistentStores { description, error in
            if let error = error {
                fatalError("failed with: \(error.localizedDescription)")
            }
        }
        
        container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        
        container.viewContext.automaticallyMergesChangesFromParent = true
        self.container = container
    }
}
