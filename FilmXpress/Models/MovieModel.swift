//
//  MovieModel.swift
//  FilmXpress
//
//  Created by Murad Farhat on 04/07/2023.
//

import UIKit

class MovieModel: Codable {
    private(set) var movieID: Int
    private(set) var movieName: String
    private(set) var movieType: String
    private(set) var movieStatus: String
    private(set) var movieSchedule: MovieScheduleModel
    private(set) var movieImage: MovieImageModel
    private(set) var movieDataLink: MovieLinksModel
    
    enum CodingKeys: String, CodingKey {
        case movieID = "id"
        case movieName = "name"
        case movieType = "type"
        case movieStatus = "status"
        case movieSchedule = "schedule"
        case movieImage = "image"
        case movieDataLink = "_links"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.movieID = try container.decode(Int.self, forKey: .movieID)
        self.movieName = try container.decode(String.self, forKey: .movieName)
        self.movieType = try container.decode(String.self, forKey: .movieType)
        self.movieStatus = try container.decode(String.self, forKey: .movieStatus)
        self.movieSchedule = try container.decode(MovieScheduleModel.self, forKey: .movieSchedule)
        self.movieImage = try container.decode(MovieImageModel.self, forKey: .movieImage)
        self.movieDataLink = try container.decode(MovieLinksModel.self, forKey: .movieDataLink)
    }
}
