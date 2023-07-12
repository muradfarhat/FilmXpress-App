//
//  MovieModel.swift
//  FilmXpress
//
//  Created by Murad Farhat on 04/07/2023.
//

import UIKit

class MovieModel: Codable {
    private(set) var id: Int
    private(set) var url: String
    private(set) var name: String
    private(set) var type: String
    private(set) var status: String
    private(set) var movieSchedule: MovieScheduleModel
    private(set) var movieImage: MovieImageModel
    private(set) var genres: [String]
    private(set) var summary: String
    
    enum CodingKeys: String, CodingKey {
        case id, url, name, type, status, genres, summary
        case movieSchedule = "schedule"
        case movieImage = "image"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.url = try container.decode(String.self, forKey: .url)
        self.name = try container.decode(String.self, forKey: .name)
        self.type = try container.decode(String.self, forKey: .type)
        self.status = try container.decode(String.self, forKey: .status)
        self.genres = try container.decode([String].self, forKey: .genres)
        self.summary = try container.decode(String.self, forKey: .summary)
        self.movieSchedule = try container.decode(MovieScheduleModel.self, forKey: .movieSchedule)
        self.movieImage = try container.decode(MovieImageModel.self, forKey: .movieImage)
    }
}

