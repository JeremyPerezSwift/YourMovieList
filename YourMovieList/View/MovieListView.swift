//
//  MovieListView.swift
//  YourMovieList
//
//  Created by Jérémy Perez on 29/12/2021.
//

import SwiftUI

struct MovieListView: View {
    @StateObject private var movieListViewModel = MovieListViewModel()
    @State private var isPresented: Bool = false
    
    private func deleteMovie(at indexSet: IndexSet) {
        indexSet.forEach { index in
            let movie = movieListViewModel.movies[index]
            movieListViewModel.deleteMovie(movie: movie)
            movieListViewModel.getAllMovies()
        }
    }
    
    var body: some View {
        List {
            ForEach(movieListViewModel.movies, id: \.id) { movie in
                
                NavigationLink(destination: ReviewListView(movie: movie)) {
                    MovieCell(movie: movie)
                }
                
            }.onDelete(perform: deleteMovie)
        }.listStyle(PlainListStyle())
        .navigationTitle("Movies")
        .navigationBarItems(trailing: Button("Add Movie") {
            isPresented = true
        })
        .sheet(isPresented: $isPresented, onDismiss: {
            movieListViewModel.getAllMovies()
        },  content: {
            AddMovieView()
        })
        .embedInNavigationView()
        
        .onAppear(perform: {
            movieListViewModel.getAllMovies()
        })
    }
}

struct MovieListScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            MovieListView()
        }
    }
}

struct MovieCell: View {
    let movie: MovieViewModel
    
    var body: some View {
        HStack {
            VStack(alignment: .leading, spacing: 5) {
                Text(movie.title)
                    .fontWeight(.bold)
                Text(movie.director)
                    .font(.caption2)
                Text(movie.releaseDate ?? "")
                    .font(.caption)
            }
            Spacer()
            RatingView(rating: .constant(movie.rating))
        }
    }
}
