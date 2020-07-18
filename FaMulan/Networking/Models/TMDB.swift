//
//  TMDB.swift
//  FaMulan
//
//  Created by Bia Plutarco on 17/07/20.
//  Copyright © 2020 Bia Plutarco. All rights reserved.
//

import Foundation
import Moya

enum TMDB {

    case genreList
    case movie(MovieFetchOptions)
}

enum MovieFetchOptions {

    case details(id: String)
    case similarMovies(to: String)
}

extension TMDB: TargetType {

    public var baseURL: URL {
        return Constants.TMDB.baseURL
    }

    public var path: String {

        switch self {

        case .movie(let fetch):

            let path = "/movie"

            switch fetch {

            case .details(let id):
                return path + "/\(id)"

            case .similarMovies(let id):
                return path + "/\(id)/similar"
            }

        case .genreList:
            return "/genre/movie/list"
        }
    }

    public var method: Moya.Method {
        return .get
    }

    public var sampleData: Data {
        return Data()
    }

    public var task: Task {
        return .requestParameters(parameters: ["api_key": Constants.TMDB.privateKey], encoding: URLEncoding.default)
    }

    public var headers: [String : String]? {
        return nil
    }
}
