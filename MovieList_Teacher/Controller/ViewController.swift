//
//  ViewController.swift
//  MovieList_Teacher
//
//  Created by Inga Kirsona on 06/09/2020.
//  Copyright © 2020 Inga Kirsona. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    
    var movies = Movie.createMovie()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
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
}
