//
//  Provider.swift
//  FaMulan
//
//  Created by Bia Plutarco on 18/07/20.
//  Copyright © 2020 Bia Plutarco. All rights reserved.
//

import UIKit
import Moya

class Provider<Target: TargetType> {

    private var provider: MoyaProvider<Target>

    init(provider: MoyaProvider<Target>) {
        self.provider = provider
    }

    func request<T: Codable>(target: Target, completion: @escaping(Result<T, APIError>) -> Void) {

        provider.request(target) { result in

            switch result {

            case .success(let value):

                    do {

                        return completion(Result.success(try JSONDecoder().decode(T.self, from: value.data)))
                    } catch {

                        return completion(Result.failure(APIError.invalidJSON))
                    }

            case .failure:
                return completion(Result.failure(APIError.unknown))
            }
        }
    }

    func requestMoviePoster(path: String, completion: @escaping (UIImage) -> Void) {

       let imageCache = NSCache<NSString, UIImage>()

        if let cachedImage = imageCache.object(forKey: path as NSString) {

            completion(cachedImage)
        }  else {

            DispatchQueue.global().async {

                do {

                    let data = try Data(contentsOf: Constants.TMDB.imageBaseURL.appendingPathComponent(path))

                        if let image = UIImage(data: data) {

                            imageCache.setObject(image, forKey: path as NSString)

                            completion(image)
                        }
                } catch {

                    print(error.localizedDescription)
                }
            }
        }
    }
}
