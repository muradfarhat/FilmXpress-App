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
    
    func setCellData(movie: MovieDetailsPosterVM) {
        self.moviePoster.sd_setImage(with: movie.moviePoster, placeholderImage: nil) { [weak self] (image, error, cacheType, url) in
            if error != nil {
                self?.moviePoster.image = UIImage(named: "movieclapper")
            }
        }
        let attributedString = NSAttributedString(string: "Visit Website", attributes: [.link: movie.movieLink!])
        self.moviePlayButton.setAttributedTitle(attributedString, for: .normal)
        self.moviePlayButton.addTarget(self, action: #selector(linkClicked(_:)), for: .touchUpInside)

    }
    
    @objc func linkClicked(_ sender: UIButton) {
        guard let link = sender.attributedTitle(for: .normal)?.attribute(.link, at: 0, effectiveRange: nil) as? URL else {
            return
        }
        UIApplication.shared.open(link)
    }

    
}
