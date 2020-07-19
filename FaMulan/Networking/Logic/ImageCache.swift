//
//  ImageCache.swift
//  FaMulan
//
//  Created by Bia Plutarco on 19/07/20.
//  Copyright © 2020 Bia Plutarco. All rights reserved.
//

import UIKit

class ImageCache {

    static let shared = ImageCache()

    let cache: NSCache<NSString,UIImage> = NSCache()

    func requestMoviePoster(path: String, completion: @escaping (UIImage) -> Void) {

        if let cachedImage = ImageCache.shared.cache.object(forKey: path as NSString) {

            completion(cachedImage)
        }  else {

            DispatchQueue.global().async {

                do {

                    let data = try Data(contentsOf: Constants.TMDB.imageBaseURL.appendingPathComponent(path))

                        if let image = UIImage(data: data) {

                            ImageCache.shared.cache.setObject(image, forKey: path as NSString)

                            completion(image)
                        }
                } catch {

                    print(error.localizedDescription)
                }
            }
        }
    }
}
