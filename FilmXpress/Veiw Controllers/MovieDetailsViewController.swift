//
//  MovieDetailsViewController.swift
//  FilmXpress
//
//  Created by Murad Farhat on 03/07/2023.
//

import UIKit

class MovieDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var movieDetailsTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.movieDetailsTableView.register(MovieDetailsSummaryCell.summaryCellNib(), forCellReuseIdentifier: MovieDetailsSummaryCell.identifire)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = self.movieDetailsTableView.dequeueReusableCell(withIdentifier: MovieDetailsSummaryCell.identifire, for: indexPath) as? MovieDetailsSummaryCell
        return cell ?? UITableViewCell()
    }
}
