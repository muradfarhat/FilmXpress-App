//
//  MovieDetailsPosterVM.swift
//  FilmXpress
//
//  Created by Murad Farhat on 05/07/2023.
//

import Foundation

class MovieDetailsPosterVM: MovieDetailsProtocol {
    
    private(set) var moviePoster: URL?
    private(set) var movieLink: URL?
    
    typealias dataType = MovieModel
    
    func setCellData(movie: dataType) {
        self.moviePoster = URL(string: movie.movieImage.movieOriginalImage)
        self.movieLink = URL(string: movie.url)
    }
    
}
