//
//  DateExtensions.swift
//  YourMovieList
//
//  Created by Jérémy Perez on 29/12/2021.
//

import Foundation

extension Date {
    
    func asFormattedString() -> String {
        let formatter = DateFormatter()
        formatter.dateFormat = "MM/dd/yyyy"
        return formatter.string(from: self)
    }
    
}
