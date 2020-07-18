//
//  APIError.swift
//  FaMulan
//
//  Created by Bia Plutarco on 18/07/20.
//  Copyright © 2020 Bia Plutarco. All rights reserved.
//

import Foundation

enum APIError: Error {

    case noData
    case invalidJSON
    case unknown
}
extension APIError: LocalizedError {

    public var errorDescription: String? {

        switch self {

        case .unknown:
            return self.localizedDescription

        case .noData:
            return "Sem resposta"

        case .invalidJSON:
            return "Erro ao parsear o retorno da API."
        }
    }
}
