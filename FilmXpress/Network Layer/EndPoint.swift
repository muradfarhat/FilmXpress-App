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
    
    // /shows or /shows/
    var path: String { get }
    
    // ?page="page_num" or nil
    var parameters: [URLQueryItem]? { get }
    
    // HTTPMethod: GET
    var method: String { get }
    
    
}
