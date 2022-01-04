//
//  AddReviewView.swift
//  YourMovieList
//
//  Created by Jérémy Perez on 30/12/2021.
//

import SwiftUI

struct AddReviewView: View {
    @StateObject private var addReviewVM = AddReviewViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    let movie: MovieViewModel
    
    var body: some View {
        Form {
            TextField("Enter title", text: $addReviewVM.title)
            TextEditor(text: $addReviewVM.text)
            
            HStack {
                Spacer()
                Button("Save") {
                    addReviewVM.addReviewForMovie(vm: movie)
                    presentationMode.wrappedValue.dismiss()
                }
                Spacer()
            }

        }
        .navigationTitle("Add Review")
        .embedInNavigationView()
    }}

struct AddReviewView_Previews: PreviewProvider {
    static var previews: some View {
        let movie = MovieViewModel(movie: Movie(context: CoreDataProvider.shared.viewContext))
        AddReviewView(movie: movie)
    }
}
