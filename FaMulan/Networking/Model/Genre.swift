//
//  Genre.swift
//  FaMulan
//
//  Created by Bia Plutarco on 17/07/20.
//  Copyright © 2020 Bia Plutarco. All rights reserved.
//

import Foundation

struct Genre: Codable, Equatable {

    var id: Int
    var name: String

    enum CodingKeys: String, CodingKey {

        case id
        case name
    }

    static func == (lhs: Genre, rhs: Genre) -> Bool {
        return lhs.id == rhs.id
    }
}
