//
//  MovieImageModel.swift
//  FilmXpress
//
//  Created by Murad Farhat on 04/07/2023.
//

import UIKit

class MovieImageModel: Codable {
    private(set) var movieMediumImage: String
    private(set) var movieOriginalImage: String
    
    enum CodingKeys: String, CodingKey {
        case movieMediumImage = "medium"
        case movieOriginalImage = "original"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        movieMediumImage = try container.decode(String.self, forKey: .movieMediumImage)
        movieOriginalImage = try container.decode(String.self, forKey: .movieOriginalImage)
    }
}
