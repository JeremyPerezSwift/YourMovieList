//
//  Review+Extensions.swift
//  YourMovieList
//
//  Created by Jérémy Perez on 04/01/2022.
//

import Foundation
import CoreData

extension Review: BaseModel {
    
    static func getReviewsByMovieId(movieId: NSManagedObjectID) -> [Review] {
        let request: NSFetchRequest<Review> = Review.fetchRequest()
        request.predicate = NSPredicate(format: "movie = %@", movieId)
        
        do {
            return try CoreDataProvider.shared.viewContext.fetch(request)
        } catch {
            return []
        }
    }
    
}
