//
//  MovieDetailsModel.swift
//  FilmXpress
//
//  Created by Murad Farhat on 05/07/2023.
//

import Foundation

class MovieDetailsModel: Codable {
    private(set) var movieID: Int
    private(set) var movieURL: String
    private(set) var movieName: String
    private(set) var movieType: String
    private(set) var movieImage: MovieImageModel
    private(set) var movieGenres: [String]
    private(set) var movieSummary: String
    
    enum CodingKeys: String, CodingKey {
        case movieID = "id"
        case movieURL = "url"
        case movieName = "name"
        case movieType = "type"
        case movieImage = "image"
        case movieGenres = "genres"
        case movieSummary = "ummary"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.movieID = try container.decode(Int.self, forKey: .movieID)
        self.movieURL = try container.decode(String.self, forKey: .movieURL)
        self.movieName = try container.decode(String.self, forKey: .movieName)
        self.movieType = try container.decode(String.self, forKey: .movieType)
        self.movieImage = try container.decode(MovieImageModel.self, forKey: .movieImage)
        self.movieGenres = try container.decode([String].self, forKey: .movieGenres)
        self.movieSummary = try container.decode(String.self, forKey: .movieSummary)
    }
}
