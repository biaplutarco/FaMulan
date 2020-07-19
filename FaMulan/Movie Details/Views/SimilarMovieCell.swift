//
//  SimilarMovieCell.swift
//  FaMulan
//
//  Created by Bia Plutarco on 18/07/20.
//  Copyright © 2020 Bia Plutarco. All rights reserved.
//

import UIKit

class SimilarMovieCell: UITableViewCell {

    private var posterImageView = UIImageView()

    private var titleLabel = UILabel(size: 16, bold: true)
    private var releaseDateLabel = UILabel(size: 14, bold: false)
    private var genresLabel = UILabel(size: 14, bold: false)

    private lazy var secondaryLabelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [releaseDateLabel, genresLabel])
        stackView.axis = .horizontal

        return stackView
    }()

    private lazy var primaryLabelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, secondaryLabelStackView])
        stackView.axis = .vertical

        return stackView
    }()

    var viewModel: SimilarMovieViewModel? {
        didSet {
            setupView()
        }
    }

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    private func setupView() {

        backgroundColor = .clear

        addSubview(posterImageView)
        addSubview(primaryLabelStackView)

        setupLabels()
        setupImageView()
        constraints()
    }

    func setupLabels() {

        titleLabel.text = viewModel?.title
        releaseDateLabel.text = viewModel?.releaseYear
        genresLabel.text = viewModel?.genres
    }

    func setupImageView() {

        posterImageView.contentMode = .scaleAspectFit

        viewModel?.loadMoviePoster { image in

            DispatchQueue.main.async {
            
                self.posterImageView.image = image
            }
        }
    }

    private func constraints() {

        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        primaryLabelStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            posterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 8),
            posterImageView.centerYAnchor.constraint(equalTo: centerYAnchor),
            posterImageView.trailingAnchor.constraint(equalTo: primaryLabelStackView.leadingAnchor, constant: -8),
            posterImageView.heightAnchor.constraint(equalToConstant: 70),
            posterImageView.widthAnchor.constraint(equalTo: posterImageView.heightAnchor),

            primaryLabelStackView.centerYAnchor.constraint(equalTo: centerYAnchor)
        ])
    }
}
