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
    private(set) var movieDetailsModel: MovieDetailsModel?
    
    func fetchMovieData(link: String, completionHandler: @escaping () -> Void) {
        DispatchQueue.global().asyncAfter(deadline: .now()) {
            AF.request(link).responseDecodable(of: MovieDetailsModel.self) { [weak self] response in
                switch response.result {
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
}
