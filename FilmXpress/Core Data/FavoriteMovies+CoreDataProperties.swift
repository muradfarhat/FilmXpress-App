//
//  FavoriteMovies+CoreDataProperties.swift
//  FilmXpress
//
//  Created by Murad Farhat on 12/07/2023.
//
//

import Foundation
import CoreData


extension FavoriteMovies {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteMovies> {
        return NSFetchRequest<FavoriteMovies>(entityName: "FavoriteMovies")
    }

    @NSManaged public var movieID: Int16

}

extension FavoriteMovies : Identifiable {

}
