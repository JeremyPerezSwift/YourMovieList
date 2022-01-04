//
//  ViewExtensions.swift
//  YourMovieList
//
//  Created by Jérémy Perez on 29/12/2021.
//

import Foundation
import SwiftUI

extension View {
    func embedInNavigationView() -> some View {
        NavigationView { self }
    }
}
