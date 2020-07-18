//
//  ViewController.swift
//  FaMulan
//
//  Created by Bia Plutarco on 17/07/20.
//  Copyright © 2020 Bia Plutarco. All rights reserved.
//

import UIKit
import Moya

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let repository = MovieDataRepository()
        var movies = [Movie]()
        
        repository.loadDetails(of: Constants.TMDB.mulanID) { result in
            switch result {
            case .failure(let error):
                print(error.localizedDescription)
            case .success(let movie):
                movies.append(movie)
            }
        }
    }
}
