//
//  FavoriteMovieEntity+CoreDataProperties.swift
//  FilmXpress
//
//  Created by Murad Farhat on 12/07/2023.
//
//

import Foundation
import CoreData


extension FavoriteMovieEntity {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<FavoriteMovieEntity> {
        return NSFetchRequest<FavoriteMovieEntity>(entityName: "FavoriteMovieEntity")
    }

    @NSManaged public var movieID: Int16

}

extension FavoriteMovieEntity : Identifiable {

}
