//
//  UIImageView+LoadURL.swift
//  FaMulan
//
//  Created by Bia Plutarco on 18/07/20.
//  Copyright © 2020 Bia Plutarco. All rights reserved.
//

import UIKit

extension UIImageView {

    func load(path: String) {
 
        DispatchQueue.global().async { [weak self] in

            if let data = try? Data(contentsOf: Constants.TMDB.imageBaseURL.appendingPathComponent(path)) {

                if let image = UIImage(data: data) {

                    DispatchQueue.main.async {

                        self?.image = image
                    }
                }
            }
        }
    }
}
