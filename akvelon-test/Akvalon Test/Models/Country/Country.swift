//
//  Country.swift
//  Akvalon Test
//
//  Created by Volodymyr on 17.04.2025.
//

import Foundation

struct Country: Codable {
    let name: CountryName?
    let flag: String?
    let capital: [Int: String]?
    
    private enum CodingKeys: String, CodingKey {
        case name
        case flag
        case capital
    }
    
    public init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        name = try? container.decode(CountryName.self, forKey: .name)
        flag = try? container.decode(String.self, forKey: .flag)
        capital = try? container.decode([Int: String].self, forKey: .capital)
    }
}
