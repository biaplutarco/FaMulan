//
//  MovieDetailsHeaderViewModel.swift
//  FaMulan
//
//  Created by Bia Plutarco on 18/07/20.
//  Copyright © 2020 Bia Plutarco. All rights reserved.
//

import Foundation

class MovieDetailsHeaderViewModel {

    private var movie: Movie

    var title: String {
        return movie.title
    }

    var likes: String {
        return String(movie.voteCount)
    }

    var popularity: String {
        return String(movie.popularity)
    }

    init(_ movie: Movie) {
        self.movie = movie
    }
}
