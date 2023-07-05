//
//  MovieDetailsProtocol.swift
//  FilmXpress
//
//  Created by Murad Farhat on 05/07/2023.
//

import Foundation

protocol MovieDetailsProtocol {
    associatedtype dataType
    func setCellData(movie: dataType)
}
