//
//  MoviesTableViewVM.swift
//  FilmXpress
//
//  Created by Murad Farhat on 04/07/2023.
//

import UIKit
import Alamofire

class MoviesTableViewVM {
    private(set) var movieCardVMs: [MovieCardViewModel] = []
    private(set) var movieCardModels: [MovieModel] = []
    private var dataPageNumber = 1
    
    func fetchMoviesData(pagination: Bool, completionHandler: @escaping () -> Void) {
        
        if pagination {
            dataPageNumber += 1
        } else {
            dataPageNumber = 1
            movieCardVMs = []
            movieCardModels = []
        }
        
        NetworkEngine.request(movieEndPoint: MoviesEndPoint.getMoviesDataPage(api: nil, page: self.dataPageNumber)) { [weak self] (result: Result<[MovieModel], Error>) in
            switch result {
            case .success(let responseData):
                self?.movieCardModels.append(contentsOf: responseData)
                let moviesVM = responseData.map {
                    MovieCardViewModel(movieModel: $0)
                }
                self?.movieCardVMs.append(contentsOf: moviesVM)
                completionHandler()

            case .failure(let error):
                print(error)
                completionHandler()
            }
        }
    }
}
