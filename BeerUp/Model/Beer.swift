//
//  Beer.swift
//  BeerUp
//
//  Created by Maksim Torburg on 26.01.2020.
//  Copyright © 2020 Maksim Torburg. All rights reserved.
//

import Foundation

struct Beer: Codable, Identifiable {    
    let id: Int
    let name: String
    let label: String
    let style: String

    enum CodingKeys: String, CodingKey {
        case id = "bid"
        case name = "beer_name"
        case label = "beer_label"
        case style = "beer_style"
    }

    static let beerStyles = [
        "American IPA",
        "Sour - Fruited",
        "IPA - Sour"
    ]

}
extension String: Identifiable {
    public var id: String {
        return self
    }
}

#if DEBUG
//let testData = {
//    return generateBeers()
//}
//func generateBeers() -> [Beer] {
//    var beers = [Beer]()
//    for i in 1...10 {
//        beers.append(Beer(bid: i, beerName: "\(i) Guiness Please"))
//    }
//    return beers
//}
#endif
