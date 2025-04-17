//
//  CountryName.swift
//  Akvalon Test
//
//  Created by Volodymyr on 17.04.2025.
//

import Foundation

struct CountryName: Codable {
    let common: String?
    let official: String?
    
    private enum CodingKeys: String, CodingKey {
        case common
        case official
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        common = try? container.decode(String.self, forKey: .common)
        official = try? container.decode(String.self, forKey: .official)
    }
}
