//
//  MovieCardViewModel.swift
//  FilmXpress
//
//  Created by Murad Farhat on 04/07/2023.
//

import UIKit

class MovieCardViewModel {
    private(set) var movieName: String
    private(set) var movieMediumImage: URL
    private(set) var movieType: String
    private(set) var movieStatus: String
    private(set) var movieTime: String
    private(set) var movieDays: [String]
//    private(set) var movieFav: Bool
    
    init(movieModel: MovieModel) {
        self.movieName = movieModel.name
        self.movieMediumImage = URL(string: movieModel.movieImage.movieMediumImage)!
        self.movieType = movieModel.type
        self.movieStatus = movieModel.status
        self.movieTime = movieModel.movieSchedule.movieTime
        self.movieDays = movieModel.movieSchedule.movieDays
    }
}
