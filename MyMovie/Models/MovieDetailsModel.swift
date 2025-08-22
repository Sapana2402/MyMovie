//
//  MovieDetailsModel.swift
//  MyMovie
//
//  Created by MACM26 on 19/08/25.
//

import Foundation

struct MovieDetailsModel: Codable {
    let overview: String
    let genres: [genresDetails]
    let release_date: String
    let original_title: String
    let poster_path: String
}

struct genresDetails: Codable, Identifiable {
    let id: Int
    let name: String
}
