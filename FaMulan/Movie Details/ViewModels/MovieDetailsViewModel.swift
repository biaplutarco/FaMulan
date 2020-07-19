//
//  MovieDetailsViewModel.swift
//  FaMulan
//
//  Created by Bia Plutarco on 18/07/20.
//  Copyright © 2020 Bia Plutarco. All rights reserved.
//

import UIKit

class MovieDetailsViewModel {

    private let repository: MovieDataRepository

    private var posterPath: String?
    private var similarMovies = [Movie]()
    private var mulan: Movie?

    var numberOfRows: Int {
        return similarMovies.count
    }

    init(repository: MovieDataRepository = MovieDataRepository()) {
        self.repository = repository
    }

    func loadMulanDetails() {

        repository.loadDetails(of: Constants.TMDB.mulanID) { result in

            switch result {

            case .failure(let error):
                print(error.localizedDescription)

            case .success(let movie):
                self.mulan = movie
            }
        }
    }

    func loadMoviePoster(completion: @escaping ((UIImage) -> Void)) {

        guard let posterPath = self.posterPath else {

            loadMulanDetails()
            return
        }

        repository.loadMoviePoster(path: posterPath) { image in

            completion(image)
        }
    }

    func similarMovieViewModel(for index: Int) -> SimilarMovieViewModel {
        return SimilarMovieViewModel(similarMovies[index])
    }

    func headerViewMovel() -> MovieDetailsHeaderViewModel {

        guard let mulan = self.mulan else {

            loadMulanDetails()
            return
        }

        return MovieDetailsHeaderView(mulan)
    }
}
