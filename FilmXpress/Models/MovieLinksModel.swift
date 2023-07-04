//
//  MovieLinksModel.swift
//  FilmXpress
//
//  Created by Murad Farhat on 04/07/2023.
//

import UIKit

class MovieLinksModel: Codable {
    private(set) var movieSelfLink: MovieSelfLinkModel
    
    enum CodingKeys: String, CodingKey {
        case movieSelfLink = "self"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.movieSelfLink = try container.decode(MovieSelfLinkModel.self, forKey: .movieSelfLink)
    }
}
