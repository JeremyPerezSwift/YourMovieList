//
//  CoreDataProvider.swift
//  YourMovieList
//
//  Created by Jérémy Perez on 29/12/2021.
//

import Foundation
import CoreData

class CoreDataProvider {
    
    let persistentContainer: NSPersistentContainer
    
    static let shared = CoreDataProvider()
    
    init() {
        persistentContainer = NSPersistentContainer(name: "YourMovieListModel")
        persistentContainer.loadPersistentStores { description, error in
            if let error = error {
                fatalError("DEBUG: Failed to initialize CoreData \(error)")
            }
        }
    }
    
    var viewContext: NSManagedObjectContext {
        return persistentContainer.viewContext
    }
    
}
