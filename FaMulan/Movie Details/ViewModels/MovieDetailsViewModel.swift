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

    private var similarMovies = [SimilarMovie]()
    private var mulan: Movie?

    var image: UIImage? {
        didSet {
            reloadImage?()
        }
    }

    var reloadImage: (() -> Void)?

    var numberOfRows: Int {
        return similarMovies.count
    }

    init(repository: MovieDataRepository = MovieDataRepository()) {
        self.repository = repository

        loadMulanDetails()
    }

    private func loadMulanDetails() {

        repository.loadDetails(of: Constants.TMDB.mulanID) { result in

            switch result {

            case .failure(let error):
                print(error.localizedDescription)

            case .success(let movie):
                self.mulan = movie

                self.loadMoviePoster()
                self.loadSimilarMovies()
            }
        }
    }

    private func loadSimilarMovies() {

        repository.loadMoviesSimilar(to: Constants.TMDB.mulanID) { result in

            switch result {

            case .failure(let error):
                print(error.localizedDescription)

            case .success(let movie):
                self.similarMovies = movie.similarMovies
            }
        }
    }

    private func loadMoviePoster() {

        guard let posterPath = self.mulan?.posterPath else { return }

        repository.loadMoviePoster(path: posterPath) { image in

            self.image = image
        }
    }

    func similarMovieViewModel(for index: Int) -> SimilarMovieViewModel {
        return SimilarMovieViewModel(similarMovies[index])
    }

    func headerViewMovel() -> MovieDetailsHeaderViewModel? {

        guard let mulan = self.mulan else { return nil }

        return MovieDetailsHeaderViewModel(mulan)
    }
}
