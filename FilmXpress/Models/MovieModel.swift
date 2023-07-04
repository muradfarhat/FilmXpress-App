//
//  MovieModel.swift
//  FilmXpress
//
//  Created by Murad Farhat on 04/07/2023.
//

import UIKit

class MovieModel: Codable {
    private(set) var movieID: Int
    private(set) var movieURL: String
    private(set) var movieName: String
    private(set) var movieType: String
    private(set) var movieStatus: String
    private(set) var movieSchedule: MovieScheduleModel
    private(set) var movieImage: MovieImageModel
    private(set) var movieGenres: [String]
    private(set) var movieSummary: String
    private(set) var movieDataLink: MovieLinksModel
    
    enum CodingKeys: String, CodingKey {
        case movieID = "id"
        case movieURL = "url"
        case movieName = "name"
        case movieType = "type"
        case movieStatus = "status"
        case movieSchedule = "schedule"
        case movieImage = "image"
        case movieGenres = "genres"
        case movieSummary = "summary"
        case movieDataLink = "_links"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.movieID = Int(try container.decode(String.self, forKey: .movieID))!
        self.movieURL = try container.decode(String.self, forKey: .movieURL)
        self.movieName = try container.decode(String.self, forKey: .movieName)
        self.movieType = try container.decode(String.self, forKey: .movieType)
        self.movieStatus = try container.decode(String.self, forKey: .movieStatus)
        self.movieSchedule = try container.decode(MovieScheduleModel.self, forKey: .movieSchedule)
        self.movieImage = try container.decode(MovieImageModel.self, forKey: .movieImage)
        self.movieGenres = try container.decode([String].self, forKey: .movieGenres)
        self.movieSummary = try container.decode(String.self, forKey: .movieSummary)
        self.movieDataLink = try container.decode(MovieLinksModel.self, forKey: .movieDataLink)
    }
}
