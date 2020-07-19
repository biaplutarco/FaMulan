//
//  UITableView+Dequeue+Register.swift
//  FaMulan
//
//  Created by Bia Plutarco on 18/07/20.
//  Copyright © 2020 Bia Plutarco. All rights reserved.
//

import UIKit

extension UITableViewCell {

    static var identifier: String {
        return String(describing: self)
    }
}

extension UITableView {

    func dequeueCell<T: UITableViewCell>(of type: T.Type, forIndexPath indexPath: IndexPath) -> T {

        guard let cell = self.dequeueReusableCell(withIdentifier: T.identifier, for: indexPath) as? T
            else {

            fatalError("CollectionViewCell wasn't registered")
        }

        return cell
    }

    func registerCell<T: UITableViewCell>(of type: T.Type) {

        self.register(T.self, forCellReuseIdentifier: T.identifier)
    }
}
