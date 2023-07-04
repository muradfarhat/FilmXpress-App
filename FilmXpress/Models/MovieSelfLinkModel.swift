//
//  MovieSelfLinkModel.swift
//  FilmXpress
//
//  Created by Murad Farhat on 04/07/2023.
//

import UIKit

class MovieSelfLinkModel: Codable {
    private(set) var movieHref: String
    
    enum CodingKeys: String, CodingKey {
        case movieHref = "href"
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.movieHref = try container.decode(String.self, forKey: .movieHref)
    }
}
