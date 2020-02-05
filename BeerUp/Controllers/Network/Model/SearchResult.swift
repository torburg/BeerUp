//
//  SearchResult.swift
//  BeerUp
//
//  Created by Maksim Torburg on 04.02.2020.
//  Copyright © 2020 Maksim Torburg. All rights reserved.
//

import Foundation

struct SearchResult: Codable {
    let response: Response
}

struct Response: Codable {
    let beers: Beers
}

struct Beers: Codable {
    let items: [Item]
}

