//
//  GerneDataRepository.swift
//  FaMulan
//
//  Created by Bia Plutarco on 18/07/20.
//  Copyright © 2020 Bia Plutarco. All rights reserved.
//

import Foundation
import Moya

struct GerneDataRepository: GenreRepository {

    private var provider: Provider<TMDB> {

        let provider = MoyaProvider<TMDB>()

        return Provider<TMDB>(provider: provider)
    }

    func loadGernes(completion: @escaping (Result<[Genre], APIError>) -> Void) {
        provider.request(target: .genreList, completion: completion)
    }
}
