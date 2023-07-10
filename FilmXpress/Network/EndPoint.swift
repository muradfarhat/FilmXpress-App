//
//  EndPoint.swift
//  FilmXpress
//
//  Created by Murad Farhat on 10/07/2023.
//

import Foundation

protocol EndPoint {
    // HTTP or HTTPS
    var scheme: String { get }
    
    // api.tvmaze.com
    var baseURL: String { get }
    
    var path: String { get }
    
    var parameters: [URLQueryItem]? { get }
    
    // GET
    var method: String { get }
}
