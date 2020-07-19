//
//  SimilarMovies.swift
//  FaMulan
//
//  Created by Bia Plutarco on 18/07/20.
//  Copyright © 2020 Bia Plutarco. All rights reserved.
//

import Foundation

struct SimilarMovies: Codable {

    var similarMovies: [SimilarMovie]

    enum CodingKeys: String, CodingKey {
        case similarMovies = "results"
    }
}

struct SimilarMovie: Codable {

    var id: Int
    var title: String
    var posterPath: String?
    var releaseDate: String
    var genresID: [Int]

    enum CodingKeys: String, CodingKey {

        case id
        case title
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case genresID = "genre_ids"
    }
}
