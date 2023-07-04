//
//  ViewController.swift
//  FilmXpress
//
//  Created by Murad Farhat on 03/07/2023.
//

import UIKit

class FilmXpressMoviesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var moviesTableView: UITableView!
    private let moviesTableViewViewModel: MoviesTableViewVM = MoviesTableViewVM()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moviesTableView.register(MovieCardTableViewCell.movieCardNib(), forCellReuseIdentifier: MovieCardTableViewCell.identifire)
        
        self.moviesTableViewViewModel.fetchMoviesData {
            DispatchQueue.main.async {
                self.moviesTableView.reloadData()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        moviesTableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.moviesTableViewViewModel.movieCardVMs.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = moviesTableView.dequeueReusableCell(withIdentifier: MovieCardTableViewCell.identifire, for: indexPath) as? MovieCardTableViewCell
        cell?.setCardData(movie: self.moviesTableViewViewModel.movieCardVMs[indexPath.row])
        return cell ?? UITableViewCell()
    }
}

