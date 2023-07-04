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
        }
        
        let movieApi = "https://api.tvmaze.com/shows?page=\(dataPageNumber)"
        
        DispatchQueue.global().asyncAfter(deadline: pagination ? .now() + 1 : .now()) {
            AF.request(movieApi).responseDecodable(of: [MovieModel].self) { [weak self] response in
                switch response.result {
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
}
