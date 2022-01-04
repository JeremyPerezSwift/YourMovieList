//
//  ReviewListView.swift
//  YourMovieList
//
//  Created by Jérémy Perez on 30/12/2021.
//

import SwiftUI

struct ReviewListView: View {
    let movie: MovieViewModel
    @State private var isPresented: Bool = false
    @StateObject private var reviewListVM = ReviewListViewModel()
    
    var body: some View {
        VStack {
            List(reviewListVM.reviews, id: \.reviewId) { review in
                HStack {
                    VStack(alignment: .leading) {
                        Text(review.title)
                        Text(review.text)
                            .font(.caption)
                    }
                    Spacer()
                    Text(review.publishedDate!.asFormattedString())
                }
            }
        }
        .navigationTitle(movie.title)
        .navigationBarItems(trailing: Button("Add New Review") {
             isPresented = true
        })
        .sheet(isPresented: $isPresented, onDismiss: {
            reviewListVM.getReviewsByMovie(vm: movie)
        }, content: {
            AddReviewView(movie: movie)
        })
        .onAppear(perform: {
            reviewListVM.getReviewsByMovie(vm: movie)
        })
    }
}

struct ReviewListView_Previews: PreviewProvider {
    static var previews: some View {
        let movie = MovieViewModel(movie: Movie(context: CoreDataProvider.shared.viewContext))
        ReviewListView(movie: movie)
    }
}
