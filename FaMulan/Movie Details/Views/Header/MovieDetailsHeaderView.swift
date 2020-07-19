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
    private var likesView = IconSubtitleView()
    private var popularityView = IconSubtitleView()

    private lazy var secondaryLabelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [likesView, popularityView])
        stackView.axis = .horizontal
        stackView.spacing = 32
        stackView.distribution = .fill

        return stackView
    }()

    private var viewModel: MovieDetailsHeaderViewModel?

    private lazy var primaryLabelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, secondaryLabelStackView])
        stackView.axis = .vertical
        stackView.spacing = 15

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

        setupData()
        constraints()
    }

    func setupData() {

        titleLabel.text = viewModel?.title

        likesView.setupView(with: UIImage.init(named: "heart-fill"), title: viewModel?.likes)
        popularityView.setupView(with: UIImage.init(named: "views"), title: viewModel?.popularity)
    }

    private func constraints() {

        primaryLabelStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            primaryLabelStackView.topAnchor.constraint(equalTo: topAnchor),
            primaryLabelStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            primaryLabelStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24)
        ])
    }
}
