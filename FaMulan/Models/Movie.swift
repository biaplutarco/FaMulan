//
//  Movie.swift
//  FaMulan
//
//  Created by Bia Plutarco on 17/07/20.
//  Copyright © 2020 Bia Plutarco. All rights reserved.
//

import Foundation

struct Movie: Codable {

    var id: Int
    var title: String
    var posterPath: String?
    var popularity: Double
    var releaseDate: String
    var voteCount: Int
    var genres: [Genre]

    enum CodingKeys: String, CodingKey {

        case id
        case title
        case posterPath = "poster_path"
        case popularity
        case releaseDate = "release_date"
        case voteCount = "vote_count"
        case genres
    }
}
