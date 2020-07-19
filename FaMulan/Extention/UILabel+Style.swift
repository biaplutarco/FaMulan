//
//  UILabel+Style.swift
//  FaMulan
//
//  Created by Bia Plutarco on 18/07/20.
//  Copyright © 2020 Bia Plutarco. All rights reserved.
//

import UIKit

extension UILabel {

    convenience init(size: CGFloat, bold: Bool) {

        self.init()

        if bold {

            font = UIFont.boldSystemFont(ofSize: size)
        } else {

            font = UIFont.systemFont(ofSize: size)
        }

        textColor = .white
    }
}

