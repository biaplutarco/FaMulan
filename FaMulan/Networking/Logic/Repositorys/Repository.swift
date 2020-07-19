//
//  Repository.swift
//  FaMulan
//
//  Created by Bia Plutarco on 18/07/20.
//  Copyright © 2020 Bia Plutarco. All rights reserved.
//

import UIKit

protocol MovieRepository {

    func loadDetails(of movieID: String, completion: @escaping(Result<Movie,APIError>) -> Void)
    func loadMoviesSimilar(to movieID: String, completion: @escaping(Result<[Movie],APIError>) -> Void)
    func loadMoviePoster(path: String, completion: @escaping(UIImage) -> Void)
}

protocol GenreRepository {
    func loadGernes(completion: @escaping(Result<[Genre],APIError>) -> Void)
}
