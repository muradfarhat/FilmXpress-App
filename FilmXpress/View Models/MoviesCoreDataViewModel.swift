//
//  MoviesCoreDataViewModels.swift
//  FilmXpress
//
//  Created by Murad Farhat on 12/07/2023.
//

import Foundation

/// Core Data view model class to add movies to favorite and remove it
class MoviesCoreDataViewModel {
    
    static private var context = CoreDataManager.shared.persistentContainer.viewContext
    
    static func getMyFavMovies() -> [FavoriteMovieEntity] {
        var models: [FavoriteMovieEntity] = []
        do {
            models = try context.fetch(FavoriteMovieEntity.fetchRequest())
        } catch {
            print(error.localizedDescription)
        }
        return models
    }
    
    static func addToFav(movieID: Int) -> FavoriteMovieEntity {
        let newItem = FavoriteMovieEntity(context: context)
        newItem.movieID = Int16(movieID)
        saveContext()
        return newItem
    }
    
    static func removeFromFav(movie: FavoriteMovieEntity) {
        context.delete(movie)
        saveContext()
    }
    
    static private func saveContext() {
        do {
            try context.save()
        } catch {
            print(error.localizedDescription)
        }
    }
}
