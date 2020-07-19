//
//  IconSubtitleView.swift
//  FaMulan
//
//  Created by Bia Plutarco on 19/07/20.
//  Copyright © 2020 Bia Plutarco. All rights reserved.
//

import UIKit

class IconSubtitleView: UIView {

    private var imageView = UIImageView()
    private var titleLabel = UILabel(size: 16, bold: false)

    private lazy var stackView: UIStackView = {
        let stackView = UIStackView(arrangedSubviews: [imageView, titleLabel])
        stackView.axis = .horizontal
        stackView.spacing = 8

        return stackView
    }()

    func setupView(with image: UIImage?, title: String?) {

        self.imageView.image = image
        self.titleLabel.text = title

        self.imageView.contentMode = .scaleAspectFill
        self.imageView.tintColor = .white

        addSubview(stackView)

        constraints()
    }

    private func constraints() {

        stackView.translatesAutoresizingMaskIntoConstraints = false
        imageView.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        NSLayoutConstraint.activate([

            stackView.topAnchor.constraint(equalTo: topAnchor),
            stackView.leadingAnchor.constraint(equalTo: leadingAnchor),
            stackView.trailingAnchor.constraint(equalTo: trailingAnchor),
            stackView.bottomAnchor.constraint(equalTo: bottomAnchor),

            imageView.heightAnchor.constraint(equalToConstant: 16),
            imageView.widthAnchor.constraint(equalTo: imageView.heightAnchor)
        ])
    }
}
