//
//  AddReviewViewModel.swift
//  YourMovieList
//
//  Created by Jérémy Perez on 30/12/2021.
//

import Foundation

class AddReviewViewModel: ObservableObject {
    var title: String = ""
    var text: String = ""
   
    func addReviewForMovie(vm: MovieViewModel) {
        let movie: Movie? = Movie.byId(id: vm.id)
        
        if let movie = movie {
            let review = Review(context: Review.viewContext)
            review.title = title
            review.text = text
            review.movie = movie
            
            review.save()
        }
    }
    
}
