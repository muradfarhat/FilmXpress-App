//
//  MovieScheduleModel.swift
//  FilmXpress
//
//  Created by Murad Farhat on 04/07/2023.
//

import UIKit

class MovieScheduleModel: Codable {
    private(set) var movieTime: String
    private(set) var movieDays: [String]
    
    enum CodingKeys: String, CodingKey {
        case movieTime = "time"
        case movieDays = "days"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        movieTime = try container.decode(String.self, forKey: .movieTime)
        movieDays = try container.decode([String].self, forKey: .movieDays)
    }
}
