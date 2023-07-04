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
    
    init(movieModel: MovieModel) {
        self.movieName = movieModel.movieName
        self.movieMediumImage = URL(string: movieModel.movieImage.movieMediumImage)!
        self.movieType = movieModel.movieType
        self.movieStatus = movieModel.movieStatus
        self.movieTime = movieModel.movieSchedule.movieTime
        self.movieDays = movieModel.movieSchedule.movieDays
    }
}
