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
    
    var selectedMovieID: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        self.movieDetailsTableView.register(MovieDetailsSummaryCell.summaryCellNib(), forCellReuseIdentifier: MovieDetailsSummaryCell.identifire)
        self.movieDetailsTableView.register(MoviePosterTableViewCell.posterCellNib(), forCellReuseIdentifier: MoviePosterTableViewCell.identifire)
        
        self.movieTableViewVM.fetchMovieData(id: selectedMovieID!) {
            DispatchQueue.main.async { [weak self] in
                self?.movieDetailsTableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.movieTableViewVM.movieDetailsCellsVM.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let posterCell = self.movieTableViewVM.movieDetailsCellsVM[indexPath.row] as? MovieDetailsPosterVM {
            let cell = self.movieDetailsTableView.dequeueReusableCell(withIdentifier: MoviePosterTableViewCell.identifire, for: indexPath) as? MoviePosterTableViewCell
            cell?.setCellData(movie: posterCell)
            return cell ?? UITableViewCell()
        } else if let summaryCell = self.movieTableViewVM.movieDetailsCellsVM[indexPath.row] as? MovieDetailsSummaryVM {
            let cell = self.movieDetailsTableView.dequeueReusableCell(withIdentifier: MovieDetailsSummaryCell.identifire, for: indexPath) as? MovieDetailsSummaryCell
            cell?.setCellData(movie: summaryCell)
            return cell ?? UITableViewCell()
        } else {
            return UITableViewCell()
        }
    }
}
