//
//  MovieDetailsHeaderView.swift
//  FaMulan
//
//  Created by Bia Plutarco on 18/07/20.
//  Copyright © 2020 Bia Plutarco. All rights reserved.
//

import UIKit

class MovieDetailsHeaderView: UITableViewHeaderFooterView {

    private var titleLabel = UILabel()
    private var likesLabel = UILabel()
    private var popularityLabel = UILabel()

    private lazy var secondaryLabelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [likesLabel, popularityLabel])
        stackView.axis = .horizontal

        return stackView
    }()

    private lazy var primaryLabelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, secondaryLabelStackView])
        stackView.axis = .vertical

        return stackView
    }()

    var viewModel: MovieDetailsHeaderViewModel? {
        didSet {
            setupView()
        }
    }

    private func setupView() {

        addSubview(primaryLabelStackView)

        setupLabels()
        constraints()
    }

    func setupLabels() {

        titleLabel.text = viewModel?.title
        likesLabel.text = viewModel?.likes
        popularityLabel.text = viewModel?.popularity
    }

    private func constraints() {

        primaryLabelStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            primaryLabelStackView.topAnchor.constraint(equalTo: topAnchor),
            primaryLabelStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            primaryLabelStackView.trailingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            primaryLabelStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
}
