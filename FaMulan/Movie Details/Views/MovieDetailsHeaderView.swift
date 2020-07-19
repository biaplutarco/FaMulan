//
//  MovieDetailsHeaderView.swift
//  FaMulan
//
//  Created by Bia Plutarco on 18/07/20.
//  Copyright © 2020 Bia Plutarco. All rights reserved.
//

import UIKit

class MovieDetailsHeaderView: UIView {

    private var titleLabel = UILabel(size: 36, bold: true)
    private var likesLabel = UILabel(size: 14, bold: false)
    private var popularityLabel = UILabel(size: 14, bold: false)

    private lazy var secondaryLabelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [likesLabel, popularityLabel])
        stackView.axis = .horizontal
        stackView.spacing = 2

        return stackView
    }()

    private var viewModel: MovieDetailsHeaderViewModel?

    private lazy var primaryLabelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, secondaryLabelStackView])
        stackView.axis = .vertical

        return stackView
    }()

    init(viewModel: MovieDetailsHeaderViewModel? = nil) {
        self.viewModel = viewModel

        super.init(frame: .zero)

        setupView()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setupView() {

        backgroundColor = .black

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
            primaryLabelStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            primaryLabelStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -16)
        ])
    }
}
