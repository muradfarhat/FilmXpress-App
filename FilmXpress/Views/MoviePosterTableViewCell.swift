//
//  MoviePosterTableViewCell.swift
//  FilmXpress
//
//  Created by Murad Farhat on 05/07/2023.
//

import UIKit

class MoviePosterTableViewCell: UITableViewCell {
    
    static let identifire = "MoviePosterTableViewCell"
    
    static func posterCellNib() -> UINib {
        return UINib(nibName: "MoviePosterTableViewCell", bundle: nil)
    }

    @IBOutlet weak private var moviePlayButton: UIButton!
    @IBOutlet weak private var moviePoster: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
