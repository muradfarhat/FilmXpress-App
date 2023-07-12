//
//  MoviesEndPoint.swift
//  FilmXpress
//
//  Created by Murad Farhat on 10/07/2023.
//

import Foundation

enum MoviesEndPoint: EndPoint {
    
    case getMoviesDataPage(api: String?, page: Int)
    
    var scheme: String {
        return "https"
    }
    
    var baseURL: String {
        return "api.tvmaze.com"
    }
    
    var path: String {
        switch self {
        case .getMoviesDataPage(let api, let movieID):
            if api != nil {
                return "/shows/\(movieID)"
            } else {
                return "/shows"
            }
        }
    }
    
    var parameters: [URLQueryItem]? {
        switch self {
        case .getMoviesDataPage(let api, let moviesPage):
            if api != nil {
                return nil
            } else {
                return [URLQueryItem(name: "page", value: "\(moviesPage)")]
            }
        }
    }
    
    var method: String {
        return "GET"
    }
}
