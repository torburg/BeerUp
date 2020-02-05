//
//  Item.swift
//  BeerUp
//
//  Created by Maksim Torburg on 05.02.2020.
//  Copyright © 2020 Maksim Torburg. All rights reserved.
//

import Foundation

struct Item : Codable, Identifiable {
    let id = UUID()
    let firstCheckinId: Int
    let beer: Beer
    let brewery: Brewery
    
    enum CodingKeys: String, CodingKey {
        case firstCheckinId = "first_checkin_id"
        case beer = "beer"
        case brewery = "brewery"
    }
}
