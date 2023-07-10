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
    private let refreshControl = UIRefreshControl()
    private var isPagination = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        moviesTableView.register(MovieCardTableViewCell.movieCardNib(), forCellReuseIdentifier: MovieCardTableViewCell.identifire)
        
        refreshControl.addTarget(self, action: #selector(refreshPage), for: UIControl.Event.valueChanged)
        refreshControl.tintColor = UIColor.white
        moviesTableView.addSubview(refreshControl)
        
        self.moviesTableView.tableFooterView = createSpinnerFooter()
        self.moviesTableViewViewModel.fetchMoviesData(pagination: false) {
            DispatchQueue.main.async { [weak self] in
                self?.moviesTableView.tableFooterView = nil
                self?.moviesTableView.reloadData()
                self?.isPagination = true
            }
        }
    }
    
    // selector method for pull to refresh
    @objc func refreshPage(send: UIRefreshControl) {
        self.moviesTableViewViewModel.fetchMoviesData(pagination: false) {
            DispatchQueue.main.async { [weak self] in
                self?.moviesTableView.reloadData()
                self?.refreshControl.endRefreshing()
            }
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        moviesTableView.deselectRow(at: indexPath, animated: true)
        
        let selectedItem = self.moviesTableViewViewModel.movieCardModels[indexPath.row]
                
        let movieDescriptionVC = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "MovieDetailsViewController") as? MovieDetailsViewController
                
        movieDescriptionVC?.selectedMovieID = selectedItem.movieID
                
        navigationController?.pushViewController(movieDescriptionVC ?? MovieDetailsViewController(), animated: true)
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
        spinner.tintColor = UIColor.white
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
                
                self.moviesTableViewViewModel.fetchMoviesData(pagination: true) { [weak self] in
                    DispatchQueue.main.async {
                        self?.moviesTableView.tableFooterView = nil
                        self?.moviesTableView.reloadData()
                    }
                }
            }
        }
    }
}

