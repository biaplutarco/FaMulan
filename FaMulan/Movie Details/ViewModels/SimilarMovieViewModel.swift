//
//  SimilarMovieViewModel.swift
//  FaMulan
//
//  Created by Bia Plutarco on 18/07/20.
//  Copyright © 2020 Bia Plutarco. All rights reserved.
//

import UIKit

class SimilarMovieViewModel {

    private let repository: MovieDataRepository

    private var similarMovie: SimilarMovie

    private var genresNames: [String]? {
        return similarMovie.genres?.map({ $0.name })
    }

    var title: String {
        return similarMovie.title
    }

    var releaseDate: String {
        return similarMovie.releaseDate
    }

    var genres: String? {

        guard let names = genresNames?[0..<2] else { return nil }

        return names.joined(separator: ", ")
    }

    init(_ similarMovie: SimilarMovie, repository: MovieDataRepository = MovieDataRepository()) {

        self.repository = repository
        self.similarMovie = similarMovie
    }

    func loadMoviePoster(completion: @escaping ((UIImage) -> Void)) {

        guard let posterPath = self.similarMovie.posterPath else { return }

        repository.loadMoviePoster(path: posterPath) { image in

            completion(image)
        }
    }
}
