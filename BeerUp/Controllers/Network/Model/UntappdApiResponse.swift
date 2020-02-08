//
//  UntappdApiResponse.swift
//  BeerUp
//
//  Created by Maksim Torburg on 06.02.2020.
//  Copyright © 2020 Maksim Torburg. All rights reserved.
//

import Foundation

struct UntappdApiResponse {
    let beersTotalCount: Int
    let beers: Beers
    let pagination: Pagination
}

extension UntappdApiResponse: Decodable {
    private enum UntappdApiResponseCodingKeys: String, CodingKey {
        case beersTotalCount = "total_count"
        case beers
        case pagination
    }
    
}

struct Beers: Decodable {
    let count: Int
    let items: [Item]
}

struct Item: Decodable, Identifiable {
    let id = UUID()
    let firstCheckinId: Int
    let beer: Beer
    let brewery: Brewery
    
    private enum ItemCodingKeys: String, CodingKey {
        case firstCheckinId = "first_checkin_id"
        case beer
        case brewery
    }
}


struct Pagination {
    let nextURL: String
    let offset: Int
    let maxId: Int
}

extension Pagination: Decodable {
     private enum PaginationCodingKeys: String, CodingKey {
            case nextURL = "next_url"
            case offset
            case maxId = "max_id"
    }
}
