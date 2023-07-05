//
//  MovieDetailsViewController.swift
//  FilmXpress
//
//  Created by Murad Farhat on 03/07/2023.
//

import UIKit

class MovieDetailsViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var movieDetailsTableView: UITableView!
    private let movieTableViewVM: MovieDetailsTableViewVM = MovieDetailsTableViewVM()
    
    var selectedMovieLink: String?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.movieDetailsTableView.register(MoviePosterTableViewCell.posterCellNib(), forCellReuseIdentifier: MoviePosterTableViewCell.identifire)
        self.movieDetailsTableView.register(MovieDetailsSummaryCell.summaryCellNib(), forCellReuseIdentifier: MovieDetailsSummaryCell.identifire)
        
        self.movieTableViewVM.fetchMovieData(link: selectedMovieLink!) {
            DispatchQueue.main.async { [weak self] in
                self?.movieDetailsTableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 2
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let posterCell = self.movieTableViewVM.movieDetailsCellsVM[indexPath.row] as? MovieDetailsPosterVM {
            let cell = self.movieDetailsTableView.dequeueReusableCell(withIdentifier: MoviePosterTableViewCell.identifire, for: indexPath) as? MoviePosterTableViewCell
            cell?.setCellData(movie: posterCell)
            return cell ?? UITableViewCell()
        } else {
            let cell = self.movieDetailsTableView.dequeueReusableCell(withIdentifier: MovieDetailsSummaryCell.identifire, for: indexPath) as? MovieDetailsSummaryCell
            cell?.setCellData(movie: self.movieTableViewVM.movieDetailsCellsVM[indexPath.row] as! MovieDetailsSummaryVM)
            return cell ?? UITableViewCell()
        }
    }
}
