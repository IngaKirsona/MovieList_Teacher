//
//  ViewController.swift
//  MovieList_Teacher
//
//  Created by Inga Kirsona on 06/09/2020.
//  Copyright © 2020 Inga Kirsona. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    var movies = Movie.createMovie()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    func configureCell(cell:MovieTableViewCell, for indexPath: IndexPath){
        let movie = movies[indexPath.row]
        cell.movieTitleLabel.text = movie.title
        cell.movieYearLabel.text = movie.year
        cell.movieImageView.image = UIImage(named: movie.poster)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return movies.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "movieCell", for: indexPath) as? MovieTableViewCell else {
            return UITableViewCell()
        }
        configureCell(cell: cell, for: indexPath)
        return cell
    }
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let alert = UIAlertController(title: "Are You sure you want to delete?", message: nil, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Cancel", style: .cancel, handler: nil))
            
            alert.addAction(UIAlertAction(title: "Delete", style: .default, handler: { (_) in
                self.movies.remove(at: indexPath.row)
                UIView.transition(with: tableView, duration: 1.0, options: .transitionCrossDissolve, animations: {
                    self.tableView.reloadData()
                }, completion: nil)
            }))
            self.present(alert, animated: true)
        }
    }
    
    
//
//    func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
//        let currentMovie = movies.remove(at: sourceIndexPath.row)
//        movies.insert(currentMovie, at: destinationIndexPath.row)
//    }
    
    
    
}
