//
//  MovieDetailsViewModel.swift
//  FaMulan
//
//  Created by Bia Plutarco on 18/07/20.
//  Copyright © 2020 Bia Plutarco. All rights reserved.
//

import UIKit

class MovieDetailsViewModel {

    private let movieRepository: MovieDataRepository
    private let genreRepository: GenreDataRepository

    private var similarMovies = [SimilarMovie]()
    private var mulan: Movie?
    private var genres = [Genre]()

    var image: UIImage? {
        didSet {
            reloadImage?()
        }
    }

    var reloadImage: (() -> Void)?

    var numberOfRows: Int {
        return similarMovies.count
    }

    init(movieRepository: MovieDataRepository = MovieDataRepository(),
         genreRepository: GenreDataRepository = GenreDataRepository()) {

        self.movieRepository = movieRepository
        self.genreRepository = genreRepository

        loadMulanDetails()
    }

    private func loadMulanDetails() {

        movieRepository.loadDetails(of: Constants.TMDB.mulanID) { result in

            switch result {

            case .failure(let error):
                print(error.localizedDescription)

            case .success(let movie):
                self.mulan = movie

                self.loadGenres()
                self.loadMoviePoster()
                self.loadSimilarMovies()
            }
        }
    }

    private func loadSimilarMovies() {

        movieRepository.loadMoviesSimilar(to: Constants.TMDB.mulanID) { result in

            switch result {

            case .failure(let error):
                print(error.localizedDescription)

            case .success(let movie):
                self.similarMovies = movie.similarMovies
            }
        }
    }

    private func loadGenres() {

        genreRepository.loadGernes { result in

            switch result {

            case .failure(let error):
                print(error.localizedDescription)

            case .success(let genres):
                self.genres = genres.genres
            }
        }
    }

    private func loadMoviePoster() {

        guard let posterPath = self.mulan?.posterPath else { return }

        movieRepository.loadMoviePoster(path: posterPath) { image in

            self.image = image
        }
    }

    func similarMovieViewModel(for index: Int) -> SimilarMovieViewModel {

        var similarMovie = similarMovies[index]
        similarMovie.genres = genres.filter({ similarMovie.genresID.contains($0.id) })
        
        return SimilarMovieViewModel(similarMovie)
    }

    func headerViewMovel() -> MovieDetailsHeaderViewModel? {

        guard let mulan = self.mulan else { return nil }

        return MovieDetailsHeaderViewModel(mulan)
    }
}
