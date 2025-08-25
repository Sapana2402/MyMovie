//
//  GenresModel.swift
//  MyMovie
//
//  Created by MACM26 on 25/08/25.
//

import Foundation

struct GenresModel: Codable {
    let genres: [GenresModelDetails]
}


struct GenresModelDetails: Codable, Identifiable {
    let id: Int
    let name: String
}
