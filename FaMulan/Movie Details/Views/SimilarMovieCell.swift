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

    private var titleLabel = UILabel()
    private var releaseDateLabel = UILabel()
    private var gerneLabel = UILabel()

    private lazy var secondaryLabelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [releaseDateLabel, gerneLabel])
        stackView.axis = .horizontal

        return stackView
    }()

    private lazy var primaryLabelStackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [titleLabel, secondaryLabelStackView])
        stackView.axis = .vertical

        return stackView
    }()

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

    private func setupView() {

        addSubview(posterImageView)
        addSubview(primaryLabelStackView)

        constraints()
    }

    private func constraints() {

        posterImageView.translatesAutoresizingMaskIntoConstraints = false
        primaryLabelStackView.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            posterImageView.topAnchor.constraint(equalTo: topAnchor, constant: 12),
            posterImageView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 12),
            posterImageView.trailingAnchor.constraint(equalTo: primaryLabelStackView.leadingAnchor, constant: 14),
            posterImageView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -12),

            primaryLabelStackView.centerYAnchor.constraint(equalTo: centerYAnchor),
            primaryLabelStackView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -12)
        ])
    }
}
