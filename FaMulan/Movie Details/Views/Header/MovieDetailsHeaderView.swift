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

    private lazy var favoriteButton: UIButton = {
        let button = UIButton()
        button.tintColor = .white
        button.setImage(UIImage.init(named: "heart"), for: .normal)
        button.addTarget(self, action: #selector(favoriteMovie), for: .touchUpInside)

        return button
    }()

    private lazy var subtitleStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [likesView, popularityView])
        stackView.axis = .horizontal
        stackView.distribution = .fillProportionally
        return stackView
    }()

    private lazy var titleStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, favoriteButton])
        stackView.axis = .horizontal
        stackView.spacing = 15

        return stackView
    }()

    private lazy var primaryStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleStackView, subtitleStackView])
        stackView.axis = .vertical
        stackView.spacing = 15

        return stackView
    }()

    private var isFavorite = false

    private var viewModel: MovieDetailsHeaderViewModel?

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

        addSubview(primaryStackView)

        setupData()
        constraints()
    }

    func setupData() {

        titleLabel.text = viewModel?.title

        likesView.setupView(with: UIImage.init(named: "heart-fill"), title: viewModel?.likes)
        popularityView.setupView(with: UIImage.init(named: "views"), title: viewModel?.popularity)
    }

    private func constraints() {

        primaryStackView.translatesAutoresizingMaskIntoConstraints = false
        favoriteButton.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            primaryStackView.topAnchor.constraint(equalTo: topAnchor, constant: 8),
            primaryStackView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 24),
            primaryStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -24),
            primaryStackView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -24),

            favoriteButton.heightAnchor.constraint(equalToConstant: 32),
            favoriteButton.widthAnchor.constraint(equalTo: favoriteButton.heightAnchor)
        ])
    }

    @objc
    func favoriteMovie(_ sender: UIButton) {

        if isFavorite {

            isFavorite = false
            favoriteButton.setImage(UIImage.init(named: "heart"), for: .normal)
        } else {

            isFavorite = true
            favoriteButton.setImage(UIImage.init(named: "heart-fill"), for: .normal)
        }
    }
}
