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
    
    typealias dataType = MovieDetailsModel
    
    func setCellData(movie: MovieDetailsModel) {
        self.movieName = movie.movieName
        self.movieType = movie.movieType
        self.movieGeners = movie.movieGenres
        self.movieSummary = movie.movieSummary
    }
}
