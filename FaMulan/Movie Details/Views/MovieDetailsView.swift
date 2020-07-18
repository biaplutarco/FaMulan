//
//  MovieDetailsView.swift
//  FaMulan
//
//  Created by Bia Plutarco on 18/07/20.
//  Copyright © 2020 Bia Plutarco. All rights reserved.
//

import UIKit

class MovieDetailsView: UIView {

    private var imageView = UIImageView()

    private lazy var tableView: UITableView = {
        let tableView = UITableView()

        tableView.backgroundColor = .clear
        tableView.separatorStyle = .none

        tableView.registerCell(of: SimilarMovieCell.self)

        tableView.delegate = self
        tableView.dataSource = self

        return tableView
    }()

    private var viewModel: MovieDetailsViewModel

    init(viewModel: MovieDetailsViewModel, frame: CGRect) {
        self.viewModel = viewModel

        super.init(frame: frame)

        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setupView() {

        backgroundColor = .black

        addSubview(imageView)
        addSubview(tableView)

        constraints()
    }

    private func constraints(){

        imageView.translatesAutoresizingMaskIntoConstraints = false
        tableView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            imageView.topAnchor.constraint(equalTo: topAnchor),
            imageView.leadingAnchor.constraint(equalTo: leadingAnchor),
            imageView.trailingAnchor.constraint(equalTo: trailingAnchor),
            imageView.bottomAnchor.constraint(equalTo: tableView.topAnchor),

            tableView.leadingAnchor.constraint(equalTo: leadingAnchor),
            tableView.trailingAnchor.constraint(equalTo: trailingAnchor),
            tableView.bottomAnchor.constraint(equalTo: bottomAnchor),
            tableView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5)
        ])
    }
}

extension MovieDetailsView: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.numberOfRows
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return tableView.dequeueCell(of: SimilarMovieCell.self, forIndexPath: viewModel.similarMovie(for: indexPath.row))
    }
}