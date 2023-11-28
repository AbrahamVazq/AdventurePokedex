//  TableViewCell+Extension.swift
//  AdventurePokedex
//  Created by Abraham Vazquez on 28/11/23.

import UIKit

public extension UITableViewCell {
    static var identifier: String {
        return String(describing: self)
    }
}
