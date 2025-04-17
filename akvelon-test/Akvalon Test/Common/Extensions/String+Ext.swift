//
//  String+Ext.swift
//  Akvalon Test
//
//  Created by Volodymyr on 17.04.2025.
//

import Foundation

extension String {
    var localized: String {
        NSLocalizedString(self, comment: "")
    }
}
