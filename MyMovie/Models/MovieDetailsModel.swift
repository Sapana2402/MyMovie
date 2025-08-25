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
    let backdrop_path: String
}

struct genresDetails: Codable, Identifiable {
    let id: Int
    let name: String
}

struct CastDetailsModel: Codable {
    let cast: [CastDetails]
}

struct CastDetails: Codable, Identifiable {
    let name: String
    let original_name: String
    let profile_path: String
    let character: String
    let id: Int
}


