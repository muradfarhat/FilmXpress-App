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

    @IBOutlet weak private var movieType: UILabel!
    @IBOutlet weak private var movieName: UILabel!
    @IBOutlet weak private var genersView: UIView!
    @IBOutlet private var genersLabels: Array<UILabel>!
    @IBOutlet weak var summaryLabel: UILabel!
    
    private var geners: [String] = []
    private let customBlueColor = UIColor(red: 0x29/255, green: 0xDB/255, blue: 0xFF/255, alpha: 1.0)  // 0x29DBFF
    private let customGrayColor = UIColor(red: 0x2A/255, green: 0x2A/255, blue: 0x28/255, alpha: 1.0)  // 0x2A2A28
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.layer.cornerRadius = 20
        self.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        self.setMovieGenres()
    }
    
    private func setMovieGenres() {
        let labelWidth: CGFloat = 95
        let labelHeight: CGFloat = 35
        let maxLabelsPerLine: Int = 3
        let horizontalSpacing: CGFloat = 15

        for (i, gen) in geners.enumerated() {
            let columnIndex = i % maxLabelsPerLine
            let rowIndex: Int = i < 3 ? 0 : 1

            let x = genersView.frame.origin.x + CGFloat(columnIndex) * (labelWidth + horizontalSpacing)

            let genreLabel = UILabel(frame: CGRect(x: x, y: CGFloat(15 + rowIndex * 45), width: labelWidth, height: labelHeight))
            genreLabel.layer.cornerRadius = 15
            genreLabel.backgroundColor = customGrayColor
            genreLabel.layer.borderWidth = 1
            genreLabel.layer.borderColor = customBlueColor.cgColor
            genreLabel.textColor = customBlueColor
            genreLabel.font = UIFont.systemFont(ofSize: 15)
            genreLabel.textAlignment = .center
            genreLabel.text = gen

            genersView.addSubview(genreLabel)
        }
    }
    
    func setCellData(movie: MovieDetailsSummaryVM) {
        self.movieName.text = movie.movieName
        self.movieType.text = movie.movieType
        self.geners = movie.movieGeners!
        self.summaryLabel.text = movie.movieSummary
        self.setMovieGenres()
    }
}
