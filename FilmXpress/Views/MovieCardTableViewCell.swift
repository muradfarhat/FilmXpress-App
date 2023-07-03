//
//  MovieCardTableViewCell.swift
//  FilmXpress
//
//  Created by Murad Farhat on 03/07/2023.
//

import UIKit

class MovieCardTableViewCell: UITableViewCell {
    
    static let identifire = "MovieCardTableViewCell"
    
    static func movieCardNib() -> UINib {
        return UINib(nibName: "MovieCardTableViewCell", bundle: nil)
    }

    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var cardView: UIView!
    @IBOutlet weak var statusView: UIView!
    @IBOutlet weak var scheduleView: UIView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.cardView.layer.cornerRadius = 20
        self.moviePoster.layer.cornerRadius = 20
        self.statusView.layer.cornerRadius = 15
        self.scheduleView.layer.cornerRadius = 15
    }
}
