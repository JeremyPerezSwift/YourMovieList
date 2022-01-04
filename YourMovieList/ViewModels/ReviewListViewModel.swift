//
//  ReviewListViewModel.swift
//  YourMovieList
//
//  Created by Jérémy Perez on 30/12/2021.
//

import Foundation
import CoreData

class ReviewListViewModel: ObservableObject {
    
   @Published var reviews = [ReviewViewModel]()
    
    func getReviewsByMovie(vm: MovieViewModel) {
        DispatchQueue.main.async {
            self.reviews = Review.getReviewsByMovieId(movieId: vm.id).map(ReviewViewModel.init)
        }
    }
    
}

struct ReviewViewModel {
    
    let review: Review
    
    var reviewId: NSManagedObjectID {
        return review.objectID
    }
    
    var title: String {
        return review.title ?? ""
    }
    
    var text: String {
        return review.text ?? ""
    }
    
    var publishedDate: Date? {
        return review.publishedAt
    }
    
}

