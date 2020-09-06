//
//  Movie.swift
//  MovieList_Teacher
//
//  Created by Inga Kirsona on 06/09/2020.
//  Copyright © 2020 Inga Kirsona. All rights reserved.
//

import Foundation
struct Movie {
    let title: String
    let year: String
    let poster: String
    
    static func createMovie() -> [Movie]{
        var movies: [Movie] = []
        
        let movieTitle = DataManager.shared.movie
        let movieYears = DataManager.shared.year
        let moviePosters = DataManager.shared.poster
        
        for index in 0..<movieTitle.count{
            let movie = Movie(title: movieTitle[index], year: movieYears[index], poster: moviePosters[index])
            movies.append(movie)
        }
        return movies
    }
    
}
