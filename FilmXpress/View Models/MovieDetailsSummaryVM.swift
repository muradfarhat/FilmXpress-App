//
//  MovieDetailsSummaryVM.swift
//  FilmXpress
//
//  Created by Murad Farhat on 05/07/2023.
//

import Foundation

class MovieDetailsSummaryVM: MovieDetailsProtocol {
    private(set) var movieName: String?
    private(set) var movieType: String?
    private(set) var movieGeners: [String]?
    private(set) var movieSummary: String?
    
    typealias dataType = MovieModel
    
    func setCellData(movie: dataType) {
        self.movieName = movie.name
        self.movieType = movie.type
        self.movieGeners = movie.genres
        self.movieSummary = movie.summary
    }
}
