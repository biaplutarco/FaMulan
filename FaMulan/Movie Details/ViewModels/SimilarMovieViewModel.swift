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

    private var movie: SimilarMovie

    var title: String {
        return movie.title
    }

    var releaseDate: String {
        return movie.releaseDate
    }

    var genres: String {

        let names = movie.genresID.map { String($0) }

        return names.joined(separator: ", ")
    }

    init(_ movie: SimilarMovie, repository: MovieDataRepository = MovieDataRepository()) {

        self.repository = repository
        self.movie = movie
    }

    func loadMoviePoster(completion: @escaping ((UIImage) -> Void)) {

        guard let posterPath = self.movie.posterPath else { return }

        repository.loadMoviePoster(path: posterPath) { image in

            completion(image)
        }
    }
}
