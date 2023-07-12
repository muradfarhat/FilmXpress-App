//
//  MovieDetailsTableViewVM.swift
//  FilmXpress
//
//  Created by Murad Farhat on 05/07/2023.
//

import Foundation
import Alamofire

class MovieDetailsTableViewVM {
    private(set) var movieDetailsCellsVM: [any MovieDetailsProtocol] = []
    private(set) var movieDetailsModel: MovieModel?
    
    func fetchMovieData(id: Int, completionHandler: @escaping () -> Void) {
        
        NetworkEngine.request(movieEndPoint: MoviesEndPoint.getMoviesDataPage(api: "movie", page: id)) { [weak self] (result: Result<MovieModel, Error>) in
            
            switch result {
                case .success(let data):
                self?.movieDetailsModel = data
                    let posterCell = MovieDetailsPosterVM()
                posterCell.setCellData(movie: data)

                    let summaryCell = MovieDetailsSummaryVM()
                summaryCell.setCellData(movie: data)

                    self?.movieDetailsCellsVM = [posterCell, summaryCell]
                    completionHandler()
                case .failure(let error):
                    print(error)
                    completionHandler()
            }
        }
    }
}
