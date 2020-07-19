//
//  MovieDataRepository.swift
//  FaMulan
//
//  Created by Bia Plutarco on 18/07/20.
//  Copyright © 2020 Bia Plutarco. All rights reserved.
//

import UIKit
import Moya

struct MovieDataRepository: MovieRepository {

    private var provider: Provider<TMDB> {

        let provider = MoyaProvider<TMDB>()

        return Provider<TMDB>(provider: provider)
    }

    func loadDetails(of movieID: String, completion: @escaping (Result<Movie, APIError>) -> Void) {
        provider.request(target: .movie(.details(id: movieID)), completion: completion)
    }

    func loadMoviesSimilar(to movieID: String, completion: @escaping (Result<SimilarMovies, APIError>) -> Void) {
        provider.request(target: .movie(.similarMovies(to: movieID)), completion: completion)
    }

    func loadMoviePoster(path: String, completion: @escaping (UIImage) -> Void) {
        ImageCache.shared.requestMoviePoster(path: path, completion: completion)
    }
}
