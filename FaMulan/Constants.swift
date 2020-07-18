//
//  Constants.swift
//  FaMulan
//
//  Created by Bia Plutarco on 18/07/20.
//  Copyright © 2020 Bia Plutarco. All rights reserved.
//

import Foundation

struct Constants {

    struct TMDB {

        static let privateKey = "7d14bbcb6a18a806a18d9a4597f450b1"
        static let mulanID = "10674"

        static var baseURL: URL {

            guard let url = URL(string: "https://api.themoviedb.org/3") else {

                fatalError("Error to convert string url to URL")
            }

            return url
        }
    }
}
