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
    
    func fetchMoviesData(completionHandler: @escaping () -> Void) {
        let movieApi = "https://api.tvmaze.com/shows?page=1"
        
        AF.request(movieApi).responseDecodable(of: [MovieModel].self) { [weak self] response in
            switch response.result {
            case .success(let responseData):
                self?.movieCardModels = responseData
                self?.movieCardVMs = responseData.map {
                    MovieCardViewModel(movieModel: $0)
                }
                completionHandler()
            case .failure(let error):
                print(error)
                completionHandler()
            }
        }
    }
}
