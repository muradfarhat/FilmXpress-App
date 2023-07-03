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
    
    private var days: [String] = ["Sunday", "Friday"]
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.cardView.layer.cornerRadius = 20
        self.moviePoster.layer.cornerRadius = 20
        self.statusView.layer.cornerRadius = 15
        self.statusView.layer.maskedCorners = [.layerMinXMinYCorner, .layerMinXMaxYCorner]
        self.scheduleView.layer.cornerRadius = 15
        
        for day in weekDays {
            day.textColor = UIColor.darkGray
        }
        
        for day in days {
            switch (day) {
                case "Saturday":
                    weekDays[0].textColor = UIColor(red: 0x29/255, green: 0xDB/255, blue: 0xFF/255, alpha: 1.0)
                case "Sunday":
                    weekDays[1].textColor = UIColor(red: 0x29/255, green: 0xDB/255, blue: 0xFF/255, alpha: 1.0)
                case "Monday":
                    weekDays[2].textColor = UIColor(red: 0x29/255, green: 0xDB/255, blue: 0xFF/255, alpha: 1.0)
                case "Tuesday":
                    weekDays[3].textColor = UIColor(red: 0x29/255, green: 0xDB/255, blue: 0xFF/255, alpha: 1.0)
                case "Wednesday":
                    weekDays[4].textColor = UIColor(red: 0x29/255, green: 0xDB/255, blue: 0xFF/255, alpha: 1.0)
                case "Thursday":
                    weekDays[5].textColor = UIColor(red: 0x29/255, green: 0xDB/255, blue: 0xFF/255, alpha: 1.0)
                case "Friday":
                    weekDays[6].textColor = UIColor(red: 0x29/255, green: 0xDB/255, blue: 0xFF/255, alpha: 1.0)
                default:
                    continue
            }
        }
    }
}
