//
//  Brewery.swift
//  BeerUp
//
//  Created by Maksim Torburg on 04.02.2020.
//  Copyright © 2020 Maksim Torburg. All rights reserved.
//

import Foundation

struct Brewery: Codable {
    let name: String
    
    private enum BreweryCodingKeys: String, CodingKey {
        case name = "brewery_name"
    }
}
