//
//  AddMovieViewModel.swift
//  YourMovieList
//
//  Created by Jérémy Perez on 29/12/2021.
//

import Foundation

class AddMovieViewModel: ObservableObject {
    
    var title: String = ""
    var director: String = ""
    @Published var rating: Int? = nil
    var releaseDate: Date = Date()
    
    func save() {
        let movie = Movie(context: Movie.viewContext)
        
        movie.title = title
        movie.director = director
        movie.rating = Double(rating ?? 0)
        movie.releaseDate = releaseDate
        
        movie.save()
    }
    
}
