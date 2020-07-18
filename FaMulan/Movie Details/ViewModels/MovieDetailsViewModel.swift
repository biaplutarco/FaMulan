//
//  MovieDetailsViewModel.swift
//  FaMulan
//
//  Created by Bia Plutarco on 18/07/20.
//  Copyright © 2020 Bia Plutarco. All rights reserved.
//

import Foundation

class MovieDetailsViewModel {

    var image: UIImage? {
        didSet {
            reloadImage?()
        }
    }
     
    var reloadImage: (() -> Void)?
    
    init(item: Icon) {
        
        self.title = item.title
        self.subtitle = item.subtitle
        self.imagePath = item.image
        
        getImage()
    }
    
    func getImage() {
        
        APIProvider.downloadImage(url: URL(string: imagePath)!) { (image, error) in
            
            if let image = image {
                self.image = image
            
            } else {
                print(error?.localizedDescription as Any)
            }
        }
    }
}
