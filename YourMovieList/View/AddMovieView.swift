//
//  AddMovieView.swift
//  YourMovieList
//
//  Created by Jérémy Perez on 29/12/2021.
//

import SwiftUI

struct AddMovieView: View {
    @StateObject private var addMovieViewModel = AddMovieViewModel()
    
    @Environment(\.presentationMode) var presentationMode
    
//    @State private var title: String = ""
//    @State private var director: String = ""
//    @State private var releaseDate: Date = Date()
//    @State private var rating: Int? = nil
    
    
    var body: some View {
        Form {
            TextField("Enter name", text: $addMovieViewModel.title)
            TextField("Enter director", text: $addMovieViewModel.director)
            HStack {
                Text("Rating")
                Spacer()
                RatingView(rating: $addMovieViewModel.rating)
            }
            DatePicker("Release Date", selection: $addMovieViewModel.releaseDate)
            
            HStack {
                Spacer()
                Button("Save") {
                    if addMovieViewModel.title != "" {
                        addMovieViewModel.save()
                        presentationMode.wrappedValue.dismiss()
                    }
                }
                Spacer()
            }
            
        }
        .navigationTitle("Add Movie")
        .embedInNavigationView()
    }
}

struct AddMovieScreen_Previews: PreviewProvider {
    static var previews: some View {
        AddMovieView()
    }
}
