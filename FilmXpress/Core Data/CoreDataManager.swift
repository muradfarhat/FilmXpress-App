//
//  CoreDataManager.swift
//  FilmXpress
//
//  Created by Murad Farhat on 12/07/2023.
//

import Foundation
import CoreData

class CoreDataManager {
    static let shared = CoreDataManager() // Singleton instance
        
    lazy var persistentContainer: NSPersistentContainer = {
        let container = NSPersistentContainer(name: "FavoriteMovies")
        container.loadPersistentStores { (_, error) in
            if let error = error as NSError? {
                fatalError("Failed to load persistent stores: \(error), \(error.userInfo)")
            }
        }
        return container
    }()
}
