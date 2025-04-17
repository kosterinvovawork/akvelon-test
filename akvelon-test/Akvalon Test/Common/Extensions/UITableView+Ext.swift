//
//  UITableView+Ext.swift
//  Akvalon Test
//
//  Created by Volodymyr on 17.04.2025.
//

import UIKit

extension UITableView {
    func dequeueCell<cell: UITableViewCell>(_ cell: cell.Type) -> cell {
        guard let resCell = self.dequeueReusableCell(withIdentifier: cell.string) as? cell else {
            fatalError("Couldn't dequeue \(cell) from \(self)")
        }
        return resCell
    }
}
