//
//  ViewController.swift
//  FilmXpress
//
//  Created by Murad Farhat on 03/07/2023.
//

import UIKit

class FilmXpressMoviesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UIScrollViewDelegate {
    
    @IBOutlet weak var moviesTableView: UITableView!
    private let moviesTableViewViewModel: MoviesTableViewVM = MoviesTableViewVM()
    private var isPagination = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moviesTableView.register(MovieCardTableViewCell.movieCardNib(), forCellReuseIdentifier: MovieCardTableViewCell.identifire)
        
        self.moviesTableView.tableFooterView = createSpinnerFooter()
        self.moviesTableViewViewModel.fetchMoviesData(pagination: false) {
            DispatchQueue.main.async {
                self.moviesTableView.tableFooterView = nil
                self.moviesTableView.reloadData()
                self.isPagination = true
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
    
    // methods for pagination scroll spinner
    private func createSpinnerFooter() -> UIView {
        let footerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 100))
        let spinner = UIActivityIndicatorView()
        spinner.center = footerView.center
        footerView.addSubview(spinner)
        spinner.startAnimating()
        return footerView
    }
    
    // methods for pagination
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if isPagination {
            let position = scrollView.contentOffset.y
            if position > (self.moviesTableView.contentSize.height - 100 - scrollView.frame.size.height) {
                self.moviesTableView.tableFooterView = createSpinnerFooter()
                
                self.moviesTableViewViewModel.fetchMoviesData(pagination: true) {
                    DispatchQueue.main.async {
                        self.moviesTableView.tableFooterView = nil
                        self.moviesTableView.reloadData()
                    }
                }
            }
        }
    }
}

