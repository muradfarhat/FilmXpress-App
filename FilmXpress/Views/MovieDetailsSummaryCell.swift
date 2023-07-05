//
//  MovieDetailsSummaryCell.swift
//  FilmXpress
//
//  Created by Murad Farhat on 05/07/2023.
//

import UIKit

class MovieDetailsSummaryCell: UITableViewCell {
    
    static let identifire = "MovieDetailsSummaryCell"
    
    static func summaryCellNib() -> UINib {
        return UINib(nibName: "MovieDetailsSummaryCell", bundle: nil)
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
}
