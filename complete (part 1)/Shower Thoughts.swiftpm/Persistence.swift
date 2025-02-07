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
        let titleAttribute = NSAttributeDescription()
        titleAttribute.name = "title"
        titleAttribute.type = .string
        thoughtEntity.properties.append(titleAttribute)
        
        let contentAttribute = NSAttributeDescription()
        contentAttribute.name = "content"
        contentAttribute.type = .string
        thoughtEntity.properties.append(contentAttribute)
        
        let dateCreatedAttribute = NSAttributeDescription()
        dateCreatedAttribute.name = "dateCreated"
        dateCreatedAttribute.type = .date
        thoughtEntity.properties.append(dateCreatedAttribute)
        
        let dateModifiedAttribute = NSAttributeDescription()
        dateModifiedAttribute.name = "dateModified"
        dateModifiedAttribute.type = .date
        thoughtEntity.properties.append(dateModifiedAttribute)
        
        let bookmarkedAttribute = NSAttributeDescription()
        bookmarkedAttribute.name = "bookmarked"
        bookmarkedAttribute.type = .boolean
        thoughtEntity.properties.append(bookmarkedAttribute)
        
        let idAttribute = NSAttributeDescription()
        idAttribute.name = "id"
        idAttribute.type = .uuid
        thoughtEntity.properties.append(idAttribute)
        
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
