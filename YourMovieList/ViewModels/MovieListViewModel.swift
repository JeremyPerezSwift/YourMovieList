//
//  MovieListViewModel.swift
//  YourMovieList
//
//  Created by Jérémy Perez on 29/12/2021.
//

import Foundation
import CoreData

class MovieListViewModel: ObservableObject {
    @Published var movies = [MovieViewModel]()
    
    func getAllMovies() {
        let movies: [Movie] = Movie.all()
        DispatchQueue.main.async {
            self.movies = movies.map(MovieViewModel.init)
        }
    }
    
    func deleteMovie(movie: MovieViewModel) {
        let movie: Movie? = Movie.byId(id: movie.id)
        if let movie = movie {
            movie.delete()
        }
    }
    
}

struct MovieViewModel {
    let movie: Movie
    
    var id: NSManagedObjectID {
        return movie.objectID
    }
    
    var title: String {
        return movie.title ?? ""
    }
    
    var director: String {
        return movie.director ?? ""
    }
    
    var rating: Int? {
        return Int(movie.rating)
    }
    
    var releaseDate: String? {
        return movie.releaseDate?.asFormattedString()
    }
    
    
}
