//
//  Array+Ext.swift
//  Akvalon Test
//
//  Created by Volodymyr on 17.04.2025.
//

import Foundation

extension Array {
    public subscript(safe index: Int) -> Element? {
      guard index >= 0, index < endIndex else {
        return nil
      }

      return self[index]
    }
}
