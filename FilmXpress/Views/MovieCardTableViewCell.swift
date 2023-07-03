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

    @IBOutlet weak private var moviePoster: UIImageView!
    @IBOutlet weak private var cardView: UIView!
    @IBOutlet weak private var statusView: UIView!
    @IBOutlet weak private var scheduleView: UIView!
    
    @IBOutlet private var weekDays: Array<UILabel>!
    
    @IBOutlet weak private var movieTime: UILabel!
    @IBOutlet weak private var movieFavorite: UIImageView!
    @IBOutlet weak private var movieStatus: UILabel!
    @IBOutlet weak private var movieType: UILabel!
    @IBOutlet weak private var movieName: UILabel!
    
    private var days: [String] = ["Sunday", "Friday", "Wednesday"]
    private let customColor = UIColor(red: 0x29/255, green: 0xDB/255, blue: 0xFF/255, alpha: 1.0)  // 0x29DBFF
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.setViewsRadius()
        self.setViewShadow(view: self.cardView, color: self.customColor.cgColor, radius: 20, opacity: 0.3)
        self.setDays()
    }
    
    // private method to set radius for card views
    private func setViewsRadius() {
        self.cardView.layer.cornerRadius = 20
        self.moviePoster.layer.cornerRadius = 20
        self.statusView.layer.cornerRadius = 15
        self.statusView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        self.scheduleView.layer.cornerRadius = 20
    }
    
    // private method to set shadow for any custom view
    private func setViewShadow(view: UIView, color: CGColor, radius: CGFloat, opacity: Float) {
        view.layer.shadowColor = color
        view.layer.shadowOffset = CGSize(width: 0.0, height: 0.0)
        view.layer.shadowRadius = radius
        view.layer.shadowOpacity = opacity
    }
    
    // private method to set days color based on JSON data
    private func setDays() {
        for day in weekDays {
            day.textColor = UIColor.darkGray
        }
        
        for day in days {
            switch (day) {
                case "Saturday":
                    weekDays[0].textColor = self.customColor
                case "Sunday":
                    weekDays[1].textColor = self.customColor
                case "Monday":
                    weekDays[2].textColor = self.customColor
                case "Tuesday":
                    weekDays[3].textColor = self.customColor
                case "Wednesday":
                    weekDays[4].textColor = self.customColor
                case "Thursday":
                    weekDays[5].textColor = self.customColor
                case "Friday":
                    weekDays[6].textColor = self.customColor
                default:
                    continue
            }
        }
    }
}
