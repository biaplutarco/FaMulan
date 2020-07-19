//
//  Genres.swift
//  FaMulan
//
//  Created by Bia Plutarco on 19/07/20.
//  Copyright © 2020 Bia Plutarco. All rights reserved.
//

import Foundation

struct Genres: Codable {

    var genres: [Genre]

    enum CodingKeys: String, CodingKey {
        case genres
    }
}
