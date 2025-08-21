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
}

struct genresDetails: Codable {
    let id: Int
    let name: String
}
