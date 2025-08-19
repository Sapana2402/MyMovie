//
//  UpcomingMovie.swift
//  MyMovie
//
//  Created by MACM26 on 18/08/25.
//

import Foundation

struct UpcomingMovieModel: Codable {
    let results : [UpcomingMovieDetails]
}

struct UpcomingMovieDetails: Codable, Identifiable {
    let id: Int
    let title: String
    let poster_path: String
    let backdrop_path: String
}
