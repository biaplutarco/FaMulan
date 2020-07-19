//
//  UIImageView+FadingGradient.swift
//  FaMulan
//
//  Created by Bia Plutarco on 18/07/20.
//  Copyright © 2020 Bia Plutarco. All rights reserved.
//

import UIKit

extension UIImageView {

    func fadingGradient(with color: UIColor, at frame: CGRect) {

        let gradientMaskLayer = CAGradientLayer()
        gradientMaskLayer.frame = frame
        gradientMaskLayer.colors = [UIColor.clear.cgColor, color.cgColor, UIColor.clear.cgColor]
        gradientMaskLayer.locations = [0, 0.15, 0.95, 1]

        layer.mask = gradientMaskLayer
    }
}
